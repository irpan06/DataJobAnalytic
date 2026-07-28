-- top use and paying skill
SELECT
  f.job_title_short,
  s.skill_name,
  AVG(f.salary_year_avg) AS avg_annual_salary,
  COUNT(DISTINCT f.job_id) AS total_appear
FROM `data-job-analytic-platform.mart_gold.fact_job_postings` f
INNER JOIN `data-job-analytic-platform.mart_gold.bridge_skill_job` b
ON f.job_id = b.job_id

INNER JOIN `data-job-analytic-platform.mart_gold.dim_skill` s
ON b.skill_id = s.skill_id

WHERE f.salary_year_avg IS NOT NULl
GROUP BY 
  f.job_title_short,
  s.skill_name

ORDER BY total_appear DESC