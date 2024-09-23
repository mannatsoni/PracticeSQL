USE database1;
SET SESSION sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- From the logins tables return the number of people that logged in, the number of total sessions and the first day of each quarter ordered by quarterly
SELECT COUNT(DISTINCT(user_id)) as Sess_id, 
COUNT(*) as seccion_cnt, min(DATE(LOGIN_TIMESTAMP)) as first_day_of_quarter
FROM logins
GROUP BY QUARTER(LOGIN_TIMESTAMP)
ORDER BY QUARTER(LOGIN_TIMESTAMP)

