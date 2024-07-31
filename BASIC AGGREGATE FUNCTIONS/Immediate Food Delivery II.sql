CREATE TABLE IF NOT EXISTS Delivery (Delivery_id INT UNIQUE, Customer_id INT, order_date DATE, customer_pref_delivery_date DATE);

INSERT INTO Delivery VALUES
( 1 , 1, '2019-08-01', '2019-08-02'),
( 2 , 2, '2019-08-02', '2019-08-02'),
( 3 , 1, '2019-08-11', '2019-08-12'),
( 4 , 3, '2019-08-24', '2019-08-24'),
( 5 , 3, '2019-08-21', '2019-08-22'),
( 6 , 2, '2019-08-11', '2019-08-13'),
( 7 , 4, '2019-08-09', '2019-08-09');

SELECT * FROM Delivery;


# --> Solution

WITH rowNumber AS 
(
    SELECT 
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS row_num,
        *
        FROM Delivery
),
ImmediateVsScheduled AS
(
    SELECT 
    CASE 
        WHEN order_date=customer_pref_delivery_date THEN  1
        ELSE  0
    END
    AS immediate_vs_scheduled,
    *
FROM rowNumber WHERE row_num = 1
)
SELECT 
    ROUND(AVG(immediate_vs_scheduled)::DECIMAL*100,2) AS immediate_percentage 
    FROM 
        ImmediateVsScheduled;




 

























































Example 1:

Input: 
Delivery table:
+-------------+-------------+------------+-----------------------------+
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
+-------------+-------------+------------+-----------------------------+
| 1           | 1           | 2019-08-01 | 2019-08-02                  |
| 2           | 2           | 2019-08-02 | 2019-08-02                  |
| 3           | 1           | 2019-08-11 | 2019-08-12                  |
| 4           | 3           | 2019-08-24 | 2019-08-24                  |
| 5           | 3           | 2019-08-21 | 2019-08-22                  |
| 6           | 2           | 2019-08-11 | 2019-08-13                  |
| 7           | 4           | 2019-08-09 | 2019-08-09                  |
+-------------+-------------+------------+-----------------------------+
Output: 
+----------------------+
| immediate_percentage |
+----------------------+
| 50.00                |
+----------------------+
Explanation: 
The customer id 1 has a first order with delivery id 1 and it is scheduled.
The customer id 2 has a first order with delivery id 2 and it is immediate.
The customer id 3 has a first order with delivery id 5 and it is scheduled.
The customer id 4 has a first order with delivery id 7 and it is immediate.
Hence, half the customers have immediate first orders.