# TABLE 1
CREATE TABLE IF NOT EXISTS Users (User_id INT PRIMARY KEY, user_name VARCHAR(30));

INSERT INTO Users VALUES
(6 ,'Alice'),
(2 ,'Bob'),
(7 ,'Alex');

SELECT * FROM Users;


# TABLE 2
CREATE TABLE IF NOT EXISTS Register (contest_id INT, user_id INT, PRIMARY KEY (contest_id, user_id));

INSERT INTO Register VALUES
( 215 , 6),
( 209 , 2),
( 208 , 2),
( 210 , 6),
( 208 , 6),
( 209 , 7),
( 209 , 6),
( 215 , 7),
( 208 , 7),
( 210 , 2),
( 207 , 2),
( 210 , 7);

SELECT * FROM Register;



# -->Solution

WITH TotalUsers AS (
    SELECT COUNT(*) AS total_users
    FROM Users
),
    ContestRegistrations AS (
    SELECT 
        contest_id, 
        COUNT(DISTINCT user_id) AS registered_users
    FROM Register
    GROUP BY contest_id
)
SELECT 
    cr.contest_id, 
    ROUND((cr.registered_users::decimal / tu.total_users) * 100, 2) AS percentage
FROM 
    ContestRegistrations cr, TotalUsers tu
ORDER BY 
    percentage DESC, 
    cr.contest_id ASC;















































Example 1:

Input: 
Users table:
+---------+-----------+
| user_id | user_name |
+---------+-----------+
| 6       | Alice     |
| 2       | Bob       |
| 7       | Alex      |
+---------+-----------+
Register table:
+------------+---------+
| contest_id | user_id |
+------------+---------+
| 215        | 6       |
| 209        | 2       |
| 208        | 2       |
| 210        | 6       |
| 208        | 6       |
| 209        | 7       |
| 209        | 6       |
| 215        | 7       |
| 208        | 7       |
| 210        | 2       |
| 207        | 2       |
| 210        | 7       |
+------------+---------+
Output: 
+------------+------------+
| contest_id | percentage |
+------------+------------+
| 208        | 100.0      |
| 209        | 100.0      |
| 210        | 100.0      |
| 215        | 66.67      |
| 207        | 33.33      |
+------------+------------+
Explanation: 
All the users registered in contests 208, 209, and 210. The percentage is 100% and we sort them in the answer table by contest_id in ascending order.
Alice and Alex registered in contest 215 and the percentage is ((2/3) * 100) = 66.67%
Bob registered in contest 207 and the percentage is ((1/3) * 100) = 33.33%