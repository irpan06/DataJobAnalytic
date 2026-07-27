{{
    config(
        materialized = 'incremental',
        unique_key = ['job_id', 'skill_id']
    )
}}

WITH staging_data AS(
    SELECT
        job_id,
        job_skills,
        job_posted_date
    FROM {{ ref('stg_job_postings') }}
    WHERE job_skills IS NOT NULL
      AND job_skills != ''
      AND job_skills != '[]'

    {% if is_incremental() %}
        AND job_posted_date >= (SELECT MAX(job_posted_date) FROM {{ this }})
    {% endif %}
),

split_skills AS(
    SELECT
        job_id,
        TRIM(skill, " '\"") AS skill_name,
    FROM staging_data,
    UNNEST(SPLIT(TRIM(job_skills, '[]'), ',')) AS skill
),

unique_skills AS(
    SELECT DISTINCT
        job_id,
        skill_name
    FROM split_skills
    WHERE skill_name IS NOT NULL
      AND skill_name != ''
      AND skill_name != '[]'
)

SELECT
    job_id,
    FARM_FINGERPRINT(skill_name) AS skill_id
FROM unique_skills
