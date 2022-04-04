Below are the queries and answers:


### Part 1: DBT Snapshots?
Answer : snapshot successfully run and can see 3 new records generated with updated data in snapshot using below query:

Query : select * from snapshots.order_snapshot
        where dbt_valid_to is not null


### Part 2: Product Funnel Results?
Answer : Total Session: 100.00%
         Cart Session: 80.80%
         Checkout Session: 62.46%

query : select 
        round((page_view)*100.0 / (all_session),2) as total_sessions,
        round((add_to_cart)*100.0 / (all_session),2) as cart_sessions,
        round((checkout)*100.0 / (all_session),2) as checkout_sessions
        from dbt_neeraj_goyal.product_funnel


### Part 2: Reflection questions -- please answer 3A or 3B, or both!?
3A : We are not using DBT in my team but we have BI Team using the same which is consuming data from us and showing in looker. The different thing i would like to do is implement snapshots at BI side which will SCD type 2 level data because we are generating SCD type 2 data internally which is costing us lot and DBT should do it in less cost.

3B : As of now there is no development environment for DBT and whatever we are sending is going directly to DBT production. so i would like to set up one development environment for our team so that we can send data internally to that development environment so that we might catch the issues earlier before sending data to production