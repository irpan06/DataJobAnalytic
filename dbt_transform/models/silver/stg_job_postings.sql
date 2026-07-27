{{ config(
    materialized='table' 
) }}

SELECT
    FARM_FINGERPRINT(
        CONCAT(
            COALESCE(company_name, 'unknown'), '|', 
            COALESCE(job_title, 'unknown'), '|', 
            COALESCE(job_location, 'unknown'), '|',
            COALESCE(job_schedule_type, 'unknown'), '|',
            COALESCE(DATE(job_posted_date))
        )
    ) AS job_hash,
    COALESCE(TRIM(company_name), 'Unknown') AS company_name,
    COALESCE(TRIM(job_title_short), 'Unknown') AS job_title_short,
    COALESCE(TRIM(job_title), 'Not Specified') AS job_title,
    COALESCE(TRIM(job_location), 'Not Specified') AS job_location,
    COALESCE(TRIM(job_via), 'Not Specified') AS job_via,
    COALESCE(TRIM(job_schedule_type), 'Not Specified') AS job_schedule_type,
    COALESCE(TRIM(search_location), 'Not Specified') AS search_location,
    COALESCE(TRIM(job_country), 'Not Specified') AS job_country,
    COALESCE(TRIM(salary_rate), 'Not Specified') AS salary_rate,
    
    COALESCE(CAST(job_work_from_home AS BOOL), FALSE) AS job_work_from_home,
    COALESCE(CAST(job_no_degree_mention AS BOOL), FALSE) AS job_no_degree_mention,
    COALESCE(CAST(job_health_insurance AS BOOL), FALSE) AS job_health_insurance,
    
    CAST(salary_year_avg AS FLOAT64) AS salary_year_avg,
    CAST(salary_hour_avg AS FLOAT64) AS salary_hour_avg,
    
    CAST(job_posted_date AS TIMESTAMP) AS job_posted_date,
    
    job_skills,
    job_type_skills

FROM {{ source('raw_data', 'job_postings') }}

WHERE job_posted_date IS NOT NULL 
  AND job_title_short IS NOT NULL