USE database1;
SET SESSION sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

WITH cte as
(SELECT COUNT(DISTINCT(user_id)) as Sess_id, 
COUNT(*) as session_cnt, min(DATE(LOGIN_TIMESTAMP)) as first_quarter_date
FROM logins
GROUP BY QUARTER(LOGIN_TIMESTAMP)
ORDER BY first_quarter_date)

select *, LAG(session_cnt, 1) OVER(order by first_quarter_date) as prev_session_cnt, 
(session_cnt - LAG(session_cnt, 1) OVER(order by first_quarter_date))*100.0 / LAG(session_cnt, 1) OVER(order by first_quarter_date) AS percentage_change
FROM cte