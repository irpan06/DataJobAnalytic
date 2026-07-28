-- total job posting
SELECT
  COUNT(*)
FROM `data-job-analytic-platform.mart_gold.fact_job_postings`;

-- total companies
SELECT
  COUNT(*)
FROM `data-job-analytic-platform.mart_gold.dim_company`;

-- median yearly salary
SELECT DISTINCT
  PERCENTILE_CONT(salary_year_avg, 0.5) OVER() AS exact_median_salary
FROM `data-job-analytic-platform.mart_gold.fact_job_postings`
WHERE salary_year_avg IS NOT NULL;