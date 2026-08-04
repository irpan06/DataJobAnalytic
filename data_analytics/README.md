<div align="center">

# 📈 Data Analytics & Business Intelligence

### *Turning the Gold Layer into Strategic Business Insights*

[![Looker Studio](https://img.shields.io/badge/Dashboard-Looker%20Studio-4285F4?logo=looker&logoColor=white)](https://datastudio.google.com/reporting/b2364af9-a2b7-4e2c-ab2b-57ea9d8e1fd7)
[![BigQuery](https://img.shields.io/badge/Source-BigQuery-4285F4?logo=googlebigquery&logoColor=white)](https://cloud.google.com/bigquery)
[![Jupyter](https://img.shields.io/badge/Notebook-Jupyter-F37626?logo=jupyter&logoColor=white)](https://jupyter.org/)
[![SQL](https://img.shields.io/badge/Analysis-Advanced%20SQL-336791?logo=postgresql&logoColor=white)](#)

</div>

> This document details the **Data Analytics & Business Intelligence** module of the [End-to-End Data Job Analytics Platform](../README.md).

<br>

## 🧭 Overview

The analytical workflow is divided into two complementary components:

| Component | Purpose |
|---|---|
| 📊 **Executive Dashboard** | High-level KPI monitoring and ad-hoc visual exploration |
| 🔬 **Deep-Dive Analysis** | A programmatic approach to uncover granular market trends using SQL and Python |

<br>

## 📊 Executive Dashboard

<p align="center">
  <img src="/assets/images/dashboard.jpg" alt="Executive Dashboard" width="850">
</p>

The dashboard provides an interactive, at-a-glance view of the job market landscape. It is directly connected to the aggregated Gold Layer (`mart_gold`) in BigQuery, ensuring high performance and data accuracy.

<div align="center">

**[🔗 Open the Interactive Dashboard](https://datastudio.google.com/reporting/b2364af9-a2b7-4e2c-ab2b-57ea9d8e1fd7)**

</div>

<br>

## 🔬 Deep-Dive Exploratory Analysis (Jupyter Notebook)

While the dashboard monitors standard KPIs, complex business questions regarding workplace flexibility and the true market valuation of technical skills require deeper statistical exploration.

The **[EDA_Job_Market.ipynb](/data_analytics/notebooks/EDA_Job_Market.ipynb)** notebook connects programmatically to the BigQuery Data Warehouse to perform complex SQL aggregations (utilizing Window Functions and CTEs) before visualizing the insights.

### 🔑 Key Investigations

| Investigation | Description |
|---|---|
| 🏠 **The Remote Work Premium** | Analyzing the correlation between Work-From-Home status, health insurance benefits, and average salary |
| 🎓 **Skill-Based Hiring Trends** | Evaluating the percentage of high-paying roles that no longer explicitly require a university degree |
| 💡 **Skill Valuation Quadrant** | Mapping the intersection between market demand frequency and highest financial compensation across complex Star Schema relationships |

<br>

## 🗃️ Directory Structure

```text
data_analytics/
│
├── sql_queries/                   # Core business logic and aggregations
│   ├── overview.sql               # Top-level KPIs (Total Jobs, Median Salary)
│   ├── market_demand.sql          # Geo-analysis and aggressive hirers
│   ├── working_conditions.sql     # WFH ratios and degree requirements
│   └── skill_analysis.sql         # Skill valuation and compensation mapping
│
├── notebooks/                     
│   └── EDA_Job_Market.ipynb       # Deep-dive analysis directly querying BigQuery
│
└── README.md                      # Analytical documentation
```

<br>

## ▶️ Execution Guide (Notebook)

To reproduce the deep-dive analysis locally:

**1. Authenticate your Google Application Default Credentials**
```bash
gcloud auth application-default login
```

**2. Launch the notebook**
```bash
jupyter notebook data_analytics/notebooks/EDA_Job_Market.ipynb
```

<br>

<div align="center">

**[← Back to Main README](../README.md)** · **[Data Engineering →](../data_engineering/README.md)**

</div>
