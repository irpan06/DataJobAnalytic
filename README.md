# Data Job Analytics Platform

![architecure](/assets/images/architecture.png)

## Overview

> _An end-to-end Data Engineering and Data Analytics project that transforms raw job posting data into a modern analytical data warehouse and provides business insights through interactive dashboards._

The project demonstrates the complete data lifecycle, adopting the **ELT (Extract, Load, Transform)** paradigm. It utilizes Python for data ingestion into Google BigQuery, orchestrates Star Schema transformations via dbt, and delivers analytical reporting through Google Looker Studio.

## Objectives
- Build an end-to-end ELT data pipeline.
- Design a dimensional data warehouse utilizing a Medallion Architecture.
- Standardize and automate data transformations using dbt.
- Deliver business insights through dynamic BI dashboards.


## Repository Structure


```text
DataJobAnalytic/
|
├── dbt_transform/                      # dbt project for data transformation (The 'T' in ELT)
|   |
│   ├── macros/                         # Custom dbt macros
│   │   └── generate_schema_name.sql
|   |
│   ├── models/                         # SQL models for Medallion Architecture
|   |   |
│   │   ├── silver/                     # Cleansed, deduplicated, and standardized data
│   │   │   └── stg_job_postings.sql
|   |   |
│   │   ├── gold/                       # Star Schema (Fact, Dimension, and Bridge tables)
│   │   │   ├── fact_job_postings.sql
│   │   │   ├── dim_company.sql
│   │   │   ├── dim_skill.sql
│   │   │   └── bridge_skill_job.sql
|   |   |
│   │   └── sources.yml                 # Source data configurations mapping to Bronze
|   |
│   ├── tests/                          # Data quality and integrity tests
│   └── dbt_project.yml                 # Core dbt configuration file
│
├── scripts/                            # Python scripts for data ingestion (The 'EL' in ELT)
│   └── extract_load.py                 # Extracts raw data and loads it to BigQuery (Bronze layer)
│
├── images/                             # Project assets and screenshots
│   └── dashboard.jpg                   # Looker Studio dashboard preview
│
└── README.md                           # Main project documentation
```

## Technology Stack
| Category               | Technology             | Purpose                                                                                          |
| ---------------------- | ---------------------- | ------------------------------------------------------------------------------------------------ |
| **Programming**        | Python                 | Handles the Extract and Load (EL) orchestration to move raw data into the warehouse.             |
| **Data Warehouse**     | Google BigQuery        | Serves as the analytical data warehouse using the Medallion Architecture (Bronze, Silver, Gold). |
| **Transformation**     | dbt (Data Build Tool)  | Automates data cleansing, standardizes structures, and orchestrates SQL transformations.         |
| **Data Modeling**      | Star Schema            | Organizes analytical data into centralized fact and dimensional tables.                          |
| **Visualization**      | Google Looker Studio   | Translates curated data into actionable insights via interactive dashboards.                     |