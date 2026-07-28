# Data Analytics & Business Intelligence

![dashboard](/assets/images/dashboard.jpg)

## Overview
This section focuses on extracting actionable business insights from the modeled Data Warehouse. The analytical workflow is divided into two main components:
1. **Executive Dashboard:** For high-level KPI monitoring and ad-hoc visual exploration.
2. **Deep-Dive Analysis:** A programmatic approach to uncover granular market trends using SQL and Python.

## 1. Executive Dashboard

The dashboard provides an interactive, at-a-glance view of the job market landscape. It is directly connected to the aggregated Gold Layer (`mart_gold`) in BigQuery, ensuring high performance and data accuracy.

🔗 [Link to Interactive Dashboard](https://datastudio.google.com/reporting/b2364af9-a2b7-4e2c-ab2b-57ea9d8e1fd7)

## 2. Deep-Dive Exploratory Analysis (Jupyter Notebook)
While the dashboard monitors standard KPIs, complex business questions regarding workplace flexibility and the true market valuation of technical skills require deeper statistical exploration.

The [EDA_Job_Market.ipynb](/data_analytics/notebooks/EDA_Job_Market.ipynb) notebook connects programmatically to the BigQuery Data Warehouse to perform complex SQL aggregations (utilizing Window Functions and CTEs) before visualizing the insights.

Key Investigations:

- **The Remote Work Premium**: Analyzing the correlation between Work-From-Home status, health insurance benefits, and average salary.
- **Skill-Based Hiring Trends**: Evaluating the percentage of high-paying roles that no longer explicitly require a university degree.
- **Skill Valuation Quadrant**: Mapping the intersection between market demand frequency and the highest financial compensation (especially across complex Star Schema relationships).

## Directory Structure
```text
data_analytics/
│
│
├── sql_queries/                   # Core business logic and aggregations
│   ├── overview.sql               # Top-level KPIs (Total Jobs, Median Salary)
│   ├── market_demand.sql          # Geo-analysis and aggressive hirers
│   ├── working_conditions.sql     # WFH ratios and degree requirements
│   └── skill_analysis.sql         # Skill valuation and compensation mapping
│
├── notebooks/                     
│   └── EDA_Job_Market.ipynb       # Deep-Dive analysis directly querying BigQuery
│
└── README.md                      # Analytical documentation
```

## Execution Guide (Notebook)
To reproduce the deep-dive analysis locally:

1. **Ensure your Google Application Default Credentials are authenticated:**
   ```bash
   gcloud auth application-default login
   ```
2. **Launch the notebook:**
    ```bash
    jupyter notebook data_analytics/notebooks/EDA_Job_Market.ipynb
    ```