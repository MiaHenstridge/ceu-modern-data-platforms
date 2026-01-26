{{
    config(
        materialized='table'
    )
}}

WITH fct_reviews AS (
    SELECT * FROM {{ ref('fct_reviews') }}
),
seed_full_moon_dates AS (
    SELECT * FROM {{ ref('seed_full_moon_dates') }}
)
SELECT 
    r.listing_id,
    r.loaded_at,
    r.reviewer_name,
    r.review_date,
    r.review_sentiment,
    r.review_text,
    CASE
        WHEN  DATEADD(DAY, 1, f.full_moon_date) IS NOT NULL THEN 'full moon'
        ELSE 'not full moon'
    END AS is_full_moon
FROM fct_reviews r
LEFT JOIN seed_full_moon_dates f
ON TO_DATE(r.review_date) = DATEADD(DAY, 1, f.full_moon_date)