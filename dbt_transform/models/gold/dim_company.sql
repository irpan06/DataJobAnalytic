{{
    config(
        materialized='table'
    )
}}

WITH unique_companies AS(
    SELECT DISTINCT 
        company_name
    FROM {{ ref('stg_job_postings') }}
)

SELECT
    FARM_FINGERPRINT(company_name) as company_id,
    company_name
FROM unique_companies
ORDER BY company_id
