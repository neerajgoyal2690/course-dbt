Below are the queries and answers:


### How many users do we have?
Answer : 124

Query : select count(distinct user_id) from dbt_neeraj_goyal.stg_orders


### On average, how many orders do we receive per hour?
Answer : 7.52

Query : select avg(orders) from 
        (select extract(day from created_at), 
        extract(hour from created_at), count(distinct order_id) as orders
        from dbt_neeraj_goyal.stg_orders
        group by extract(day from created_at), 
        extract(hour from created_at)) as orders


### On average, how long does an order take from being placed to being delivered?
Answer : 3 days 21:24:11.803279

Query : select avg(delivered_at-created_at) 
        from dbt_neeraj_goyal.stg_orders


### How many users have only made one purchase? Two purchases? Three+ purchases?
Answer : one order - 25
         two order - 28
         3 or more order - 71

Query : with user_order as (select u.user_id, count(distinct order_id) as cnt
        from dbt_neeraj_goyal.stg_users as u join
        dbt_neeraj_goyal.stg_orders as o
        on u.user_id = o.user_id
        group by u.user_id)
        select sum(case when cnt = 1 then 1 else 0 end) one_purchage, 
        sum(case when cnt = 2 then 1 else 0 end) two_purchage,
        sum(case when cnt > 2 then 1 else 0 end) three_or_more
        from user_order


### On average, how many unique sessions do we have per hour?
Answer : 16.33

Query : select avg(session_id) 
        from (select extract(day from created_at), 
        extract(hour from created_at), count(distinct session_id) as session_id 
        from events
        group by extract(day from created_at), extract(hour from created_at)
        ) hourly_session