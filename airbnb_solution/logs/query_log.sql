-- created_at: 2026-01-09T07:51:07.284769+00:00
-- finished_at: 2026-01-09T07:51:07.550328+00:00
-- elapsed: 265ms
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c19c97-0107-6fa8-0000-001ba55733a1
-- desc: execute adapter call
CREATE TABLE IF NOT EXISTS DEV.audit_log ( model_name STRING, run_timestamp TIMESTAMP )
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "airbnb", "target_name": "dev"} */;
-- created_at: 2026-01-09T07:51:08.641662+00:00
-- finished_at: 2026-01-09T07:51:08.960053+00:00
-- elapsed: 318ms
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: not available
-- desc: dbt run query
select * from (SELECT * FROM AIRBNB.DEV.dim_listings_cleansed WHERE 
            LISTING_NAME IS NOT NULL AND LISTING_NAME <> '' AND
            ROOM_TYPE IS NOT NULL AND ROOM_TYPE <> '' AND
    TRUE
) limit 10;
