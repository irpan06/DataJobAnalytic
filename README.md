<div align="center">

# 📊 Data Job Analytics Platform

### *From Raw Job Postings to Production-Grade Business Insights*

[![Python](https://img.shields.io/badge/Python-3.11-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![BigQuery](https://img.shields.io/badge/Google%20BigQuery-Data%20Warehouse-4285F4?logo=googlebigquery&logoColor=white)](https://cloud.google.com/bigquery)
[![dbt](https://img.shields.io/badge/dbt-Transformation-FF694B?logo=dbt&logoColor=white)](https://www.getdbt.com/)
[![Looker Studio](https://img.shields.io/badge/Looker%20Studio-Visualization-4285F4?logo=looker&logoColor=white)](https://lookerstudio.google.com/)
[![Status](https://img.shields.io/badge/Status-Active-success)](#)

</div>

<p align="center">
  <img src="/assets/images/architecture.png" alt="Architecture Overview" width="850">
</p>

<br>

## 🧭 Overview

> An end-to-end **Data Engineering & Data Analytics** project that transforms raw job posting data into a modern analytical data warehouse and delivers business insights through interactive dashboards.

This project demonstrates the complete data lifecycle, adopting the **ELT (Extract, Load, Transform)** paradigm. It uses **Python** for data ingestion into **Google BigQuery**, orchestrates **Star Schema** transformations via **dbt**, and delivers analytical reporting through **Google Looker Studio**.

<br>

## 🎯 Objectives

| # | Goal |
|:-:|------|
| 1 | Build an end-to-end **ELT data pipeline** |
| 2 | Design a dimensional data warehouse using a **Medallion Architecture** |
| 3 | Standardize and automate data transformations using **dbt** |
| 4 | Deliver business insights through **dynamic BI dashboards** |

<br>

## 🏗️ Project Structure

This project follows a modular architecture that strictly separates data ingestion, business analytics, and downstream application consumption — mirroring how production data teams organize their work.

<table>
<tr>
<td width="70">✅</td>
<td>

### Phase 1 — Data Engineering
**[📖 View Full Engineering Documentation →](data_engineering/README.md)**

The foundation of the data factory. The ELT process ensures data quality and integrity before any analysis occurs.
- **Extraction & Ingestion** — pulling raw data from external sources into the Landing Zone
- **Data Warehouse Modeling** — transforming raw data into a Star Schema (Fact, Dimension, and Bridge tables) within the Gold Layer
- **Execution Focus** — elegantly handling many-to-many relationships (e.g. multi-skill mapping per job posting) directly at the warehouse level

</td>
</tr>
<tr>
<td width="70">✅</td>
<td>

### Phase 2 — Data Analytics & BI
**[📖 View Full Analytics Documentation →](data_analytics/README.md)**

The investigative lens. Using refined data from the Gold Layer, this phase answers strategic business questions.
- **Executive Dashboard** — interactive monitoring of high-level KPIs (Total Job Volume, Median Salary, etc.)
- **Deep-Dive Analysis** — advanced SQL (Window Functions & CTEs) to uncover:
  - 🏠 *The Remote Work Premium* — correlation between WFH status, salary, and health insurance
  - 🎓 *Skill-Based Hiring* — the shifting trend toward recruitment without academic degree requirements
  - 💡 *Skill Valuation Map* — the intersection of market demand and financial compensation

</td>
</tr>
<tr>
<td width="70">🚧</td>
<td>

### Phase 3 — Data Application
**[🔗 Go to Application Repository](#)** *(to be added)*

The downstream product layer. This phase focuses on an interactive application (such as a **Market Value Predictor**) that consumes the Data Warehouse to provide salary estimates and recommendations based on structured user input.

</td>
</tr>
</table>

<br>

## 📂 Repository Structure

```text
DataJobAnalytics/
│
├── data_engineering/                    # Extraction scripts, DDL schemas, and ELT transformations
├── data_analytics/                      # Jupyter Notebooks and SQL queries for deep-dive analysis
├── (coming_soon) data_application/      # Model serving architecture and web application interface
└── README.md                            # Main project documentation
```

<br>

## ⚙️ Technology Stack

| Category | Technology | Purpose |
|---|---|---|
| 🐍 **Programming** | Python | Handles the Extract and Load (EL) orchestration to move raw data into the warehouse |
| 🏢 **Data Warehouse** | Google BigQuery | Serves as the analytical data warehouse using the Medallion Architecture (Bronze, Silver, Gold) |
| 🔧 **Transformation** | dbt (Data Build Tool) | Automates data cleansing, standardizes structures, and orchestrates SQL transformations |
| ⭐ **Data Modeling** | Star Schema | Organizes analytical data into centralized fact and dimensional tables |
| 📈 **Visualization** | Google Looker Studio | Translates curated data into actionable insights via interactive dashboards |

<br>

<div align="center">

**[Data Engineering →](data_engineering/README.md)** · **[Data Analytics →](data_analytics/README.md)**

</div>
