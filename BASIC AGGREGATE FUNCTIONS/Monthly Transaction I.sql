CREATE TYPE  allowedStates AS ENUM('approved', 'declined');

CREATE TABLE IF NOT EXISTS Transactions
(
    id INT PRIMARY KEY, 
    country VARCHAR(30), 
    state allowedStates, 
    amount INT, 
    trans_date DATE
);

INSERT INTO transactions VALUES
(121, 'US' ,'approved' ,1000 ,'2018-12-18'),
(122, 'US' ,'declined' ,2000 ,'2018-12-19'),
(123, 'US' ,'approved' ,2000 ,'2019-01-01'),
(124, 'DE' ,'approved' ,2000 ,'2019-01-07');

SELECT * FROM Transactions;



SELECT
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    COUNT(*) AS trans_count,
    COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM
    Transactions
GROUP BY
    TO_CHAR(trans_date, 'YYYY-MM'),
    country
ORDER BY
    month,
    country;
;



SELECT 
    TO_CHAR(trans_date, 'YYYY-MM'), 
    country,
    COUNT()
FROM
    Transactions
GROUP BY
    TO_CHAR(trans_date, 'YYYY-MM'),
    country
































Table: Transactions

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |
+---------------+---------+
id is the primary key of this table.
The table has information about incoming transactions.
The state column is an enum of type ["approved", "declined"].
 

Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

Return the result table in any order.

The query result format is in the following example.

 

Example 1:

Input: 
Transactions table:
+------+---------+----------+--------+------------+
| id   | country | state    | amount | trans_date |
+------+---------+----------+--------+------------+
| 121  | US      | approved | 1000   | 2018-12-18 |
| 122  | US      | declined | 2000   | 2018-12-19 |
| 123  | US      | approved | 2000   | 2019-01-01 |
| 124  | DE      | approved | 2000   | 2019-01-07 |
+------+---------+----------+--------+------------+
Output: 
+----------+---------+-------------+----------------+--------------------+-----------------------+
| month    | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
+----------+---------+-------------+----------------+--------------------+-----------------------+
| 2018-12  | US      | 2           | 1              | 3000               | 1000                  |
| 2019-01  | US      | 1           | 1              | 2000               | 2000                  |
| 2019-01  | DE      | 1           | 1              | 2000               | 2000                  |
+----------+---------+-------------+----------------+--------------------+-----------------------+