{{
    config(
        materialized = 'table'
    )
}}

SELECT DISTINCT 
    company_id,
    company_name
FROM {{ ref('stg_job_postings') }}