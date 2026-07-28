-- top hiring country
SELECT DISTINCT 
  job_country,
  COUNT(*) AS total
FROM `data-job-analytic-platform.mart_gold.fact_job_postings`
WHERE job_title_short = 'Data Analyst'
GROUP BY 
  job_country
HAVING COUNT(*) > 1
ORDER BY total DESC
LIMIT 5;

-- top hiring companies
SELECT DISTINCT 
  c.company_name,
  f.job_country,
  COUNT(*) AS total
FROM `data-job-analytic-platform.mart_gold.fact_job_postings` f
INNER JOIN `data-job-analytic-platform.mart_gold.dim_company` c
ON f.company_id = c.company_id
WHERE f.job_title_short = 'Data Analyst'
GROUP BY 
  c.company_name,
  f.job_country
HAVING COUNT(*) > 1
ORDER BY total DESC
LIMIT 5;