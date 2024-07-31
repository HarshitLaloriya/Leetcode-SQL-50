# TABLE 1
CREATE TABLE IF NOT EXISTS Signups (user_id INT UNIQUE, time_stamp TIMESTAMP);

INSERT INTO Signups VALUES
(3 ,'2020-03-21 10:16:13'),
(7 ,'2020-01-04 13:57:59'),
(2 ,'2020-07-29 23:09:44'),
(6 ,'2020-12-09 10:39:37');

SELECT * FROM Signups;


# TABLE 2
CREATE TYPE yn AS ENUM('confirmed', 'timeout');

CREATE TABLE IF NOT EXISTS Confirmations 
(
    user_id INT, 
    time_stamp TIMESTAMP, 
    action yn,
    PRIMARY KEY(user_id, time_stamp));


INSERT INTO confirmations VALUES
(3 ,'2021-01-06 03:30:46' ,'timeout'),
(3 ,'2021-07-14 14:00:00' ,'timeout'),
(7 ,'2021-06-12 11:57:29' ,'confirmed'),
(7 ,'2021-06-13 12:58:28' ,'confirmed'),
(7 ,'2021-06-14 13:59:27' ,'confirmed'),
(2 ,'2021-01-22 00:00:00' ,'confirmed'),
(2 ,'2021-02-28 23:59:59' ,'timeout');


SELECT * FROM confirmations;


# --> Solution

SELECT 
    user_id,
    ROUND(CAST(AVG(yn) AS NUMERIC), 2) AS confirmation_rate
    FROM
    (
    SELECT 
    sup.user_id,
    cnf.action, 
    CASE 
        WHEN cnf.action='confirmed' THEN 1  
        ELSE 0
    END AS yn
    FROM Signups AS sup
    LEFT JOIN Confirmations AS cnf USING(user_id))
GROUP BY user_id;
















































Example 1:

Input: 
Signups table:
+---------+---------------------+
| user_id | time_stamp          |
+---------+---------------------+
| 3       | 2020-03-21 10:16:13 |
| 7       | 2020-01-04 13:57:59 |
| 2       | 2020-07-29 23:09:44 |
| 6       | 2020-12-09 10:39:37 |
+---------+---------------------+
Confirmations table:
+---------+---------------------+-----------+
| user_id | time_stamp          | action    |
+---------+---------------------+-----------+
| 3       | 2021-01-06 03:30:46 | timeout   |
| 3       | 2021-07-14 14:00:00 | timeout   |
| 7       | 2021-06-12 11:57:29 | confirmed |
| 7       | 2021-06-13 12:58:28 | confirmed |
| 7       | 2021-06-14 13:59:27 | confirmed |
| 2       | 2021-01-22 00:00:00 | confirmed |
| 2       | 2021-02-28 23:59:59 | timeout   |
+---------+---------------------+-----------+
Output: 
+---------+-------------------+
| user_id | confirmation_rate |
+---------+-------------------+
| 6       | 0.00              |
| 3       | 0.00              |
| 7       | 1.00              |
| 2       | 0.50              |
+---------+-------------------+
Explanation: 
User 6 did not request any confirmation messages. The confirmation rate is 0.
User 3 made 2 requests and both timed out. The confirmation rate is 0.
User 7 made 3 requests and all were confirmed. The confirmation rate is 1.
User 2 made 2 requests where one was confirmed and the other timed out. The confirmation rate is 1 / 2 = 0.5.