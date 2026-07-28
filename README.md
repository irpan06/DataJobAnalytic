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

The project is divided into two complementary phases.

### [Part 1: Data Engineering](/data_engineering/README.md)
Design and implementation of the analytics platform, including data ingestion, transformation, and warehouse modeling.

**Key topics**
- Python Extract & Load (EL)
- Medallion Architecture
- BigQuery Data Warehouse
- Star Schema
- dbt

### [Part 2: Data Analytics & Business Intelligence](/data_analytics/README.md)
Analysis and visualization of curated data to generate business insights.

**Key topics**
- Looker Studio
- Dashboard Design
- KPI & Metric Definitions
- Interactive Filters
- Job Market Trends

## Technology Stack
| Category               | Technology             | Purpose                                                                                          |
| ---------------------- | ---------------------- | ------------------------------------------------------------------------------------------------ |
| **Programming**        | Python                 | Handles the Extract and Load (EL) orchestration to move raw data into the warehouse.             |
| **Data Warehouse**     | Google BigQuery        | Serves as the analytical data warehouse using the Medallion Architecture (Bronze, Silver, Gold). |
| **Transformation**     | dbt (Data Build Tool)  | Automates data cleansing, standardizes structures, and orchestrates SQL transformations.         |
| **Data Modeling**      | Star Schema            | Organizes analytical data into centralized fact and dimensional tables.                          |
| **Visualization**      | Google Looker Studio   | Translates curated data into actionable insights via interactive dashboards.                     |