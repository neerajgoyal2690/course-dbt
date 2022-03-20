WITH base_users AS (
    SELECT * 
    FROM {{ ref('stg_users') }}
),

base_orders AS (
    SELECT * 
    FROM {{ ref('stg_orders') }}
)

SELECT
    u.user_id,
    o.order_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.created_at,
    u.updated_at,
    u.address_id,
    o.delivered_at,
    o.status
FROM base_users u join base_orders o
on u.user_id = o.user_id