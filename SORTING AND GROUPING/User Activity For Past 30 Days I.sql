-- Active: 1722003249103@@127.0.0.1@5432@leetcode@y
CREATE TYPE activityType AS ENUM('open_session', 'end_session', 'scroll_down', 'send_message');

CREATE TABLE IF NOT EXISTS Activity
(user_id       INT,
session_id     INT,
activity_date  DATE,
activity_type activityType);

INSERT INTO activity VALUES
( 1 ,1 ,'2019-07-20' ,'open_session'),
( 1 ,1 ,'2019-07-20' ,'scroll_down'),
( 1 ,1 ,'2019-07-20' ,'end_session'),
( 2 ,4 ,'2019-07-20' ,'open_session'),
( 2 ,4 ,'2019-07-21' ,'send_message'),
( 2 ,4 ,'2019-07-21' ,'end_session'),
( 3 ,2 ,'2019-07-21' ,'open_session'),
( 3 ,2 ,'2019-07-21' ,'send_message'),
( 3 ,2 ,'2019-07-21' ,'end_session'),
( 4 ,3 ,'2019-06-25' ,'open_session'),
( 4 ,3 ,'2019-06-25' ,'end_session');

SELECT * FROM Activity;


# -->SOLUTION

-->There are a few points to consider:
-- Use of HAVING vs. WHERE: The HAVING clause is used to filter groups after aggregation, 
-- whereas the WHERE clause is used to filter rows before aggregation. For filtering rows based on the date, 
-- you should use the WHERE clause.

SELECT 
    activity_date AS day, 
    COUNT(DISTINCT user_id) AS active_users
FROM 
    Activity
WHERE 
    activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY 
    activity_date;

-----------------------> OR
SELECT 
    activity_date AS day, 
    COUNT(DISTINCT user_id) AS active_users
FROM 
    Activity
WHERE 
    activity_date BETWEEN ('2019-07-27'::DATE - INTERVAL '29 DAYS') AND '2019-07-27'
GROUP BY 
    activity_date;






--Even though this solution yields the same answer, why does it not make a good choice for answering this question?
-->Why this Solution not fit in a good choice to solve this question
SELECT 
    activity_date AS day,
     COUNT(DISTINCT session_id) AS active_users
FROM 
    activity
GROUP BY 
    activity_date
HAVING 
    activity_date BETWEEN ('2019-07-27'::DATE - INTERVAL '29 DAYS') AND '2019-07-27';































Example 1:

Input: 
Activity table:
+---------+------------+---------------+---------------+
| user_id | session_id | activity_date | activity_type |
+---------+------------+---------------+---------------+
| 1       | 1          | 2019-07-20    | open_session  |
| 1       | 1          | 2019-07-20    | scroll_down   |
| 1       | 1          | 2019-07-20    | end_session   |
| 2       | 4          | 2019-07-20    | open_session  |
| 2       | 4          | 2019-07-21    | send_message  |
| 2       | 4          | 2019-07-21    | end_session   |
| 3       | 2          | 2019-07-21    | open_session  |
| 3       | 2          | 2019-07-21    | send_message  |
| 3       | 2          | 2019-07-21    | end_session   |
| 4       | 3          | 2019-06-25    | open_session  |
| 4       | 3          | 2019-06-25    | end_session   |
+---------+------------+---------------+---------------+
Output: 
+------------+--------------+ 
| day        | active_users |
+------------+--------------+ 
| 2019-07-20 | 2            |
| 2019-07-21 | 2            |
+------------+--------------+ 
Explanation: Note that we do not care about days with zero active users.