{{
    config(
        materialized = 'table'
    )
}}

WITH extracted_skills AS(
    SELECT
        job_skills
    FROM {{ ref('stg_job_postings') }}
    WHERE job_skills IS NOT NULL
      AND job_skills != '[]'
      AND job_skills != ''
),

split_skills AS(
    SELECT
        TRIM(skill, " '\"") AS skill_name
    FROM extracted_skills,
    UNNEST(SPLIT(TRIM(job_skills, '[]'), ',')) AS skill
),

unique_skills AS(
    SELECT DISTINCT
        skill_name,
    FROM split_skills
    WHERE skill_name IS NOT NULL 
      AND skill_name != ''
      AND skill_name != '[]'
)

SELECT DISTINCT
    FARM_FINGERPRINT(skill_name) AS skill_id,
    skill_name
FROM unique_skills
ORDER BY skill_name