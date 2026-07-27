{{
    config(
        materialized = 'incremental',
        unique_key = 'job_id'
    )
}}

WITH staging_data AS(
    SELECT *
    FROM {{ref('stg_job_postings') }}

    {% if is_incremental() %}
        WHERE job_posted_date >= (SELECT MAX(job_posted_date) FROM {{ this }})
    {% endif %}
)

SELECT
    job_id,
    company_id,
    job_title_short,
    job_title,
    job_posted_date, 
    job_location, 
    job_via,
    job_schedule_type, 
    job_work_from_home, 
    search_location,
    job_no_degree_mention, 
    job_health_insurance, 
    job_country,
    salary_rate, 
    salary_year_avg, 
    salary_hour_avg
FROM staging_data