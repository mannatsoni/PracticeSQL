USE database1;
SET SESSION sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- Display user ids that logged in in January 2024 but not in November 2023

SELECT DISTINCT(user_id)
FROM logins
WHERE login_timestamp BETWEEN "2024-01-01" AND "2024-01-31"
AND user_id NOT IN (SELECT user_id
FROM logins
WHERE login_timestamp BETWEEN "2023-11-01" AND "2023-11-30")