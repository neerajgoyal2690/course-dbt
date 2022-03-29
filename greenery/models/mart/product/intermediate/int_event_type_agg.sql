{% set sql_statement %}
    select distinct quote_literal(event_type) as event_type, event_type as column_name from {{ ref('stg_events') }}
{% endset %}

{%- set event_types = dbt_utils.get_query_results_as_dict(sql_statement) -%}

SELECT
    product_id
    {% for event_type in event_types['event_type'] %}
    ,COUNT(DISTINCT CASE WHEN event_type = {{event_type}} THEN session_id END) AS {{ event_types['column_name'][loop.index0] }}
    {% endfor %}
FROM {{ ref('stg_events') }}
group by product_id