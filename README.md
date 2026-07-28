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

## Project Structure

This project utilizes a modular architecture that strictly separates data ingestion, business analytics, and downstream application consumption.

### Phase 1: Data Engineering (✅)
**[View Full Engineering Documentation](data_engineering/README.md)**

The first pillar focuses on the foundation of the data factory. The ELT (Extract, Load, Transform) process is designed to ensure data quality and integrity before any analysis occurs.
* **Extraction & Ingestion:** Pulling raw data from external sources into the Landing Zone.
* **Data Warehouse Modeling:** Transforming raw data into a Star Schema (Fact, Dimension, and Bridge tables) within the Gold Layer using an efficient modeling system.
* **Execution Focus:** Elegantly handling many-to-many relationships (such as multi-skill mapping for a single job posting) directly at the warehouse level.

### Phase 2: Data Analytics & BI (✅)
**[View Full Analytics Documentation](data_analytics/README.md)**

The second pillar acts as the investigative lens. Utilizing the refined data from the Gold Layer, this phase answers strategic business questions.
* **Executive Dashboard:** Interactive monitoring of high-level KPIs (Total Job Volume, Median Salary, etc.).
* **Deep-Dive Analysis:** In-depth statistical exploration using advanced SQL (Window Functions & CTEs) to uncover specific insights, such as:
  * *The Remote Work Premium* (The correlation between WFH status, salary, and health insurance).
  * *Skill-Based Hiring* (The shifting trend towards recruitment without academic degree requirements).
  * *Skill Valuation Map* (The intersection of market demand and financial compensation).

### Phase 3: Data Application (In Progress)
**[Go to Application Repository]** *(To be added)*

The third pillar is the development of a downstream product. This phase focuses on designing an interactive application (such as a Market Value Predictor) that consumes data flow from the Data Warehouse to provide specific recommendations and salary estimates based on structured end-user inputs.

## Repository Structure
```text
DataJobAnalytics/
│
├── data_engineering/                    # Extraction scripts, DDL schemas, and ELT transformations
├── data_analytics/                      # Jupyter Notebooks and SQL queries for deep-dive analysis
├── (coming_soon) data_application/      # Model serving architecture and web application interface
└── README.md                            # Main project documentation
```


## Technology Stack
| Category               | Technology             | Purpose                                                                                          |
| ---------------------- | ---------------------- | ------------------------------------------------------------------------------------------------ |
| **Programming**        | Python                 | Handles the Extract and Load (EL) orchestration to move raw data into the warehouse.             |
| **Data Warehouse**     | Google BigQuery        | Serves as the analytical data warehouse using the Medallion Architecture (Bronze, Silver, Gold). |
| **Transformation**     | dbt (Data Build Tool)  | Automates data cleansing, standardizes structures, and orchestrates SQL transformations.         |
| **Data Modeling**      | Star Schema            | Organizes analytical data into centralized fact and dimensional tables.                          |
| **Visualization**      | Google Looker Studio   | Translates curated data into actionable insights via interactive dashboards.                     |