# Data Engineering

## Overview
> _This section documents the complete data engineering implementation of the project, covering data preparation, warehouse design, ETL development, orchestration, and monitoring._

> **TL;DR for Engineering Reviewers:**
> * **Decoupled Architecture:** Extracted and loaded raw data via **Python** and modeled analytics in **Google BigQuery (OLAP)**.
> * **Medallion & Star Schema:** Implemented Bronze ➔ Silver ➔ Gold layers with a dedicated **Bridge Table** for many-to-many skill relationships.
> * **Production Ready:** Optimized with 64-bit integer hashing (`FARM_FINGERPRINT`), dynamic array unnesting, and automated **dbt (Data Build Tool)** orchestration.

**Note:** This document details the **Data Engineering** module of the [End-to-End Data Job Analytics Platform](../README.md)

## Dataset & Acknowledgments

This project utilizes a comprehensive job posting dataset originally scraped and curated by **Luke Barousse** for his [Data Engineering course](https://github.com/lukebarousse/SQL_Data_Engineering_Course) 

While the foundational dataset and core Star Schema modeling concept (Fact, Company Dim, Skill Dim, and Bridge Table) were adapted from his tutorial, **the overall data architecture and ETL pipeline have been significantly extended and re-engineered for OLAP performance and production readiness.**

### Key Engineering Extensions & Modifications
To elevate the project from a local tutorial implementation to a production-grade data platform, several key enhancements were introduced:
* **Engine Migration:** Leveraged **Google BigQuery** as a highly scalable, serverless cloud data warehouse.
* **Medallion Architecture:** Expanded the direct transformation into a layered data pipeline (Bronze ➔ Silver ➔ Gold)
* **Schema & Deduplication Enhancement:** Implemented a 64-bit integer hash for high-speed deduplication and utilized native BigQuery `UNNEST` functions for array parsing.
* **Production Orchestration & Observability:** Integrated **dbt** for modular SQL transformations, data quality testing, and incremental table materializations.

> 🙏 **Credit:** Special thanks to [Luke Barousse](https://www.youtube.com/@LukeBarousse) for making the raw dataset publicly available to the data community

## Architecture
![architecture](/assets/images/architecture.png)

The data engineering pipeline adopts the **Medallion Architecture** to progressively transform raw operational data into business-ready datasets. Raw data is first loaded into the Bronze layer, refined into analytical tables in the Silver layer, and finally aggregated into Gold data marts for reporting and analytics.

| Layer | Purpose |
|--------|---------|
| Bronze | Store raw operational data |
| Silver | Clean, standardize, and model analytical data |
| Gold | Store aggregated data marts for reporting |

## Data Modelling

![data_model](/assets/images/ERD_images.webp)

The pipeline adopts a **Star Schema** to optimize analytical queries. A centralized fact table stores job posting transactions, while dimension tables provide descriptive attributes such as company and skills.

This design improves query performance, simplifies analytical workloads, and provides the foundation for the Gold data marts.

## Key Technical Decisions & Engineering Highlights

To ensure optimal query performance, data integrity, and pipeline reliability, several production-grade engineering practices were implemented:

* **Decoupled Architecture:** Established a strict architectural boundary by utilizing Python purely as a reliable ingestion tool for raw CSV integration, and **BigQuery** as the high-performance analytical warehouse. This isolates write-heavy operational workloads from read-heavy analytical dashboards.
* **High-Speed OLAP Deduplication:** Because scraped datasets lack reliable primary keys, a 64-bit integer hash (`FARM_FINGERPRINT()`) is generated for instant, memory-efficient deduplication.
* **Advanced SQL Array Parsing & Star Schema Modeling:** Job skills embedded as flat Python-style strings (`['SQL', 'Python']`) are parsed and exploded dynamically within SQL using BigQuery's native `UNNEST(SPLIT())` functions. This normalized data is structured into a Star Schema with a dedicated **Bridge Table**, cleanly resolving complex Many-to-Many skill relationships without data redundancy.
* **Production-Grade Orchestration:** The entire transformation pipeline is orchestrated using **dbt**, keeping core processing logic decoupled and independently testable. Incremental materializations are utilized to optimize compute costs.

## Directory Structure
The data engineering module contains all components required to build the data engineering pipeline, from source data preparation to data warehouse creation and ETL execution.

```text
data_engineering/
│
├── README.md                            # Data Engineering technical documentation
│
├── scripts/                             # Orchestration and automation entry points
│   └── extract_load.py                  # Python script extracting and loading data to Bronze layer
│
└── dbt_transform/                       # SQL DML transformation scripts
    ├── macros/                          
    │   └── generate_schema_name.sql     # Custom dbt macro for dynamic schema routing
    │
    ├── models/                  
    │   ├── silver/                      # Cleanses, deduplicates, and standardizes data
    │   │   ├── schema.yml               # Source definitions, documentation, and data tests
    │   │   └── stg_job_postings.sql     # Silver layer transformation logic
    │   │
    │   └── gold/                        # Populates Star Schema and business metrics
    │       ├── bridge_skill_job.sql     # Resolves Many-to-Many relationships
    │       ├── dim_company.sql          # Company dimension table
    │       ├── dim_skill.sql            # Skill dimension table
    │       ├── fact_job_postings.sql    # Central fact table for job postings
    │       └── schema.yml               # Gold layer documentation and data tests
    │
    ├── tests/                           # Custom data quality and referential integrity tests
    └── dbt_project.yml                  # Core dbt configuration             
```

## Execution Guide
This guide provides step-by-step instructions to initialize the databases, build the analytical data warehouse, and execute the end-to-end ETL pipeline

### Prerequisites & Environment Setup
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/irpan06/Data-Job-Analytics-Platform.git
   cd Data-Job-Analytics-Platform
2. **Install Dependencies**
    ```bash
    python -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
    ```
3. **GCP Configuration:**
    Ensure you have a Google Cloud Platform project with BigQuery enabled and authenticate your environment:
    ``` bash
    gcloud auth application-default login
    ```
4. **dbt Configuration:**
    Ensure your `profiles.yml` is correctly configured to connect to your BigQuery project.
### Step-by-Step Execution
#### Step 1: Extract and Load (Bronze Layer)
Execute the Python script to fetch the raw dataset and ingest it into the BigQuery staging table:
```bash
python data_engineering/scripts/extract_load.py
```

#### Step 2: Transform (Silver & Gold Layers)
Navigate to the dbt project directory, install dependencies, and execute the transformation pipeline that standardizes data into the Star Schema:
```bash
cd data_engineering/dbt_transform
dbt deps
dbt run
```
Successful Execution Output:
```text
15:07:53  Running with dbt=1.12.0
15:07:54  Registered adapter: bigquery=1.12.0
15:07:55  Found 5 models, 20 data tests, 1 source, 562 macros
15:07:55
15:07:55  Concurrency: 1 threads (target='dev')
15:07:55
15:08:01  1 of 5 START sql table model wh_silver.stg_job_postings ........................ [RUN]
15:08:08  1 of 5 OK created sql table model wh_silver.stg_job_postings ................... [CREATE TABLE (1.6m rows, 408.7 MiB processed) in 7.44s]
15:08:08  2 of 5 START sql incremental model mart_gold.bridge_skill_job .................. [RUN]
15:08:15  2 of 5 OK created sql incremental model mart_gold.bridge_skill_job ............. [CREATE TABLE (7.1m rows, 91.8 MiB processed) in 7.35s]
15:08:15  3 of 5 START sql table model mart_gold.dim_company ............................. [RUN]
15:08:20  3 of 5 OK created sql table model mart_gold.dim_company ........................ [CREATE TABLE (215.9k rows, 38.1 MiB processed) in 4.40s]
15:08:20  4 of 5 START sql table model mart_gold.dim_skill ............................... [RUN]
15:08:23  4 of 5 OK created sql table model mart_gold.dim_skill .......................... [CREATE TABLE (255.0 rows, 67.2 MiB processed) in 3.58s]
15:08:23  5 of 5 START sql incremental model mart_gold.fact_job_postings ................. [RUN]
15:08:29  5 of 5 OK created sql incremental model mart_gold.fact_job_postings ............ [CREATE TABLE (1.6m rows, 243.6 MiB processed) in 5.83s]
15:08:29
15:08:29  Finished running 2 incremental models, 3 table models in 0 hours 0 minutes and 34.60 seconds (34.60s).
15:08:29
15:08:29  Completed successfully
15:08:29
15:08:29  Done. PASS=5 WARN=0 ERROR=0 SKIP=0 NO-OP=0 REUSED=0 TOTAL=5
```