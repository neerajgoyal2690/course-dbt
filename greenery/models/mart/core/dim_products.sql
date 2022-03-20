WITH base_products AS (
    SELECT * 
    FROM {{ ref('stg_products') }}
)

SELECT
    product_id,
    name,
    price,
    inventory
FROM base_products