{{
  config(
    materialized='view'
  )
}}  

SELECT
    event_id,
    session_id,
    user_id,
    event_type,
    page_url,
    created_at
FROM {{ref('stg_events')}}