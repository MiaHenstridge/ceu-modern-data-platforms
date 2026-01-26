--change materialization to table (since this contains a join so it will be more efficient to query as a table)
-- this model level config will override the project level config in dbt_project.yml
{{
    config(
        materialized='table'
    )
}}

WITH dim_listings_cleansed AS (
    SELECT * FROM {{ ref('dim_listings_cleansed') }}
), 
dim_hosts_cleansed AS (
    SELECT * FROM {{ ref('dim_hosts_cleansed') }}
)
SELECT
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.host_id,
    l.price,
    h.host_name,
    h.is_superhost AS host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) AS updated_at
FROM dim_listings_cleansed l 
LEFT JOIN dim_hosts_cleansed h
ON l.host_id = h.host_id