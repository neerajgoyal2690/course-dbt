Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


Queries:
124
select count(distinct user_id) from dbt_neeraj_goyal.stg_orders

7.52
select avg(orders) from 
(select extract(day from created_at), 
extract(hour from created_at), count(distinct order_id) as orders
from dbt_neeraj_goyal.stg_orders
group by extract(day from created_at), 
extract(hour from created_at)) as orders

3 days 21:24:11.803279
select avg(delivered_at-created_at) 
from dbt_neeraj_goyal.stg_orders

one order - 25
two order - 28
3 or more order - 71

with user_order as (select u.user_id, count(distinct order_id) as cnt
from dbt_neeraj_goyal.stg_users as u join
dbt_neeraj_goyal.stg_orders as o
on u.user_id = o.user_id
group by u.user_id)
select sum(case when cnt = 1 then 1 else 0 end) one_purchage, 
sum(case when cnt = 2 then 1 else 0 end) two_purchage,
sum(case when cnt > 2 then 1 else 0 end) three_or_more
from user_order

16.33
select avg(session_id) 
from (select extract(day from created_at), 
extract(hour from created_at), count(distinct session_id) as session_id 
from events
group by extract(day from created_at), extract(hour from created_at)
) hourly_session