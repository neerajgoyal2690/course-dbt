select 
count(distinct session_id) as all_session,
count(distinct case when event_type in ('checkout') then session_id end) as checkout,
count(distinct case when event_type in ('add_to_cart') then session_id end) as add_to_cart,
count(distinct case when event_type in ('page_view') then session_id end) as page_view
FROM {{ ref('stg_events') }}