# TABLE 1
CREATE TABLE IF NOT EXISTS Prices 
(   product_id INT,
    start_date DATE, 
    end_date DATE, 
    price INT,
    PRIMARY KEY (product_id, start_date, end_date));


INSERT INTO Prices VALUES
( 1 ,'2019-02-17' , '2019-02-28', 5  ),
( 1 ,'2019-03-01' , '2019-03-22', 20 ),
( 2 ,'2019-02-01' , '2019-02-20', 15 ),
( 2 ,'2019-02-21' , '2019-03-31', 30 );

SELECT * FROM Prices;


# TABLE 2
CREATE TABLE IF NOT EXISTS UnitsSold 
(   product_id INT, 
    purchase_date DATE, 
    units INT);


INSERT INTO UnitsSold VALUES
(1 ,'2019-02-25' ,100),
(1 ,'2019-03-01' ,15 ),
(2 ,'2019-02-10' ,200),
(2 ,'2019-03-22' ,30 );


SELECT * FROM UnitsSold;


# -->Solution

WITH temp AS 
(
    SELECT 
        pr.product_id, 
        (pr.price * us.units) AS total_price, 
        us.units 
    FROM Prices AS pr
    JOIN UnitsSold AS us
    ON pr.product_id = us.product_id
    AND us.purchase_date BETWEEN pr.start_date AND pr.end_date
)
SELECT 
    product_id, 
    ROUND(SUM(total_price) / SUM(units)::numeric, 2) AS average_price
FROM temp
GROUP BY product_id;





















































 

Example 1:

Input: 
Prices table:
+------------+------------+------------+--------+
| product_id | start_date | end_date   | price  |
+------------+------------+------------+--------+
| 1          | 2019-02-17 | 2019-02-28 | 5      |
| 1          | 2019-03-01 | 2019-03-22 | 20     |
| 2          | 2019-02-01 | 2019-02-20 | 15     |
| 2          | 2019-02-21 | 2019-03-31 | 30     |
+------------+------------+------------+--------+
UnitsSold table:
+------------+---------------+-------+
| product_id | purchase_date | units |
+------------+---------------+-------+
| 1          | 2019-02-25    | 100   |
| 1          | 2019-03-01    | 15    |
| 2          | 2019-02-10    | 200   |
| 2          | 2019-03-22    | 30    |
+------------+---------------+-------+
Output: 
+------------+---------------+
| product_id | average_price |
+------------+---------------+
| 1          | 6.96          |
| 2          | 16.96         |
+------------+---------------+
Explanation: 
Average selling price = Total Price of Product / Number of products sold.
Average selling price for product 1 = ((100 * 5) + (15 * 20)) / 115 = 6.96
Average selling price for product 2 = ((200 * 15) + (30 * 30)) / 230 = 16.96