-- wfh vs wfo ratio
SELECT
  job_title_short,
  COUNT(CASE WHEN job_work_from_home = TRUE THEN 1 END) AS total_wfh,
  COUNT(CASE WHEN job_work_from_home = FALSE OR job_work_from_home IS NULL THEN 1 END) AS total_wfo,
  COUNT(*) AS total_jobs,
  ROUND(SAFE_DIVIDE(COUNT(CASE WHEN job_work_from_home = TRUE THEN 1 END), COUNT(*)) * 100, 2) AS percentage_wfh,
  ROUND(SAFE_DIVIDE(COUNT(CASE WHEN job_work_from_home = FALSE OR job_work_from_home IS NULL THEN 1 END), COUNT(*)) * 100, 2) AS percentage_wfo
FROM `data-job-analytic-platform.mart_gold.fact_job_postings`
GROUP BY job_title_short;

-- job degree mention vs not ratio
SELECT
  job_title_short,
  COUNT(CASE WHEN job_no_degree_mention = TRUE THEN 1 END) AS total_no_degree,
  COUNT(CASE WHEN job_no_degree_mention = FALSE OR job_no_degree_mention IS NULL THEN 1 END) AS total_degree,
  COUNT(*) AS total_jobs,
  ROUND(SAFE_DIVIDE(COUNT(CASE WHEN job_no_degree_mention = TRUE THEN 1 END), COUNT(*)) * 100, 2) AS percentage_no_degree,
  ROUND(SAFE_DIVIDE(COUNT(CASE WHEN job_no_degree_mention = FALSE OR job_no_degree_mention IS NULL THEN 1 END), COUNT(*)) * 100, 2) AS percentage_degree
FROM `data-job-analytic-platform.mart_gold.fact_job_postings`
GROUP BY job_title_short;

-- insurance
SELECT 
    job_work_from_home,
    COUNT(job_id) AS total_jobs,
    ROUND(SAFE_DIVIDE(SUM(CASE WHEN job_health_insurance THEN 1 ELSE 0 END), COUNT(job_id)) * 100, 2) AS percentage_with_insurance,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM `data-job-analytic-platform.mart_gold.fact_job_postings`
WHERE salary_year_avg IS NOT NULL
GROUP BY job_work_from_home