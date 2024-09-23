USE database1;

-- How many users did not login for 5 months --
select u.user_name, u.user_id, MAX(l.LOGIN_TIMESTAMP) AS last_login
FROM logins as l
LEFT JOIN users as u 
ON l.USER_ID = u.USER_ID
group by u.user_name, u.user_id
HAVING MAX(LOGIN_TIMESTAMP) < DATE_ADD(CURDATE(), INTERVAL -5 MONTH);

SELECT u.USER_NAME, MAX(l.LOGIN_TIMESTAMP) AS last_login
FROM users AS u
LEFT JOIN logins AS l ON u.USER_ID = l.USER_ID
GROUP BY u.USER_NAME
HAVING MAX(l.LOGIN_TIMESTAMP) < DATE_SUB('2024-06-28 11:31:24', INTERVAL 5 MONTH);


