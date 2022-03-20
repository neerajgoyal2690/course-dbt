Below are the queries and answers:


### what is user repeat rate?
Answer : 79.84

Query : with order_count as 
    (select user_id, count(distinct order_id) as order_cnt
    from dbt_neeraj_goyal.seg_user_order
    group by user_id)

    select 
    round(sum(case when order_cnt > 1 then 1 else 0 end)*100.0/count(*), 2)
    from order_count;


### What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?
Answer: 
1. People from Texas and California ordered a lot so people from these states will likely to purchage again
2. Poeple from Kansas and Michigan ordered only once so they are not likely to purchase again so address is a got indicator to measure repeat rate
3. Other feature could be based on products which are getting sold frequently and user behaviour on price and freqency he is ordering.