Below are the queries and answers:


### What is our overall conversion rate?
Answer : 62.46

Query : 

    select 
    count(distinct case when event_type = 'checkout' then session_id end)*100.0/count(distinct session_id) as cnt
    from dbt_neeraj_goyal.stg_events

### WWhat is our conversion rate by product?
Answer : 
| Product Name | Page View  | Add to Cart  | Conversion Rate |
| :---:   | :-: | :-: | :-: |
| Bird of Paradise | 60 | 33 | 55.00 |
| Devil's Ivy | 45 | 24 | 53.33 |
| Dragon Tree | 62 | 34 | 54.84 |
| Pothos | 61 | 24 | 39.34 |
| Philodendron | 62 | 32 | 51.61 |


Query: 

    select prod.name, page_view, add_to_cart, 
    round((add_to_cart*100.0/page_view),2) as conversion_rate  
    from dbt_neeraj_goyal.int_event_type_agg evnt 
    join dbt_neeraj_goyal.stg_products as prod
    on evnt.product_id = prod.product_id