{{
    config(
        severity='warn'
    )
}}

WITH fct_reviews AS (
    SELECT * FROM {{ ref('fct_reviews') }}
),
dim_listings_cleansed AS (
    SELECT * FROM {{ ref('dim_listings_cleansed') }}
)
SELECT
    r.*,
    l.created_at AS listing_created_at
FROM fct_reviews r 
JOIN dim_listings_cleansed l 
on r.listing_id = l.listing_id 
WHERE l.created_at > r.review_date
LIMIT 10