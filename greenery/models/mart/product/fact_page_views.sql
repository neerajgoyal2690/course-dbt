WITH base_events AS (
    SELECT
        *
    FROM
        {{ ref('stg_events') }}
),

base_users AS (
    SELECT
        *
    FROM
        {{ ref('stg_users') }}
)

SELECT
    base_events.event_id,
    base_events.session_id,
    base_events.user_id,
    base_users.first_name,
    base_users.last_name,
    base_users.email,
    base_events.page_url,
    base_events.event_type,
    base_events.created_at
FROM
    base_events
LEFT OUTER JOIN
    base_users
ON
    base_events.user_id = base_users.user_id
WHERE
    base_events.event_type = 'page_view'