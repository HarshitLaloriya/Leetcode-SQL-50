# TABLE 1

CREATE TABLE IF NOT EXISTS Sales
(
    sale_id    INT,
    product_id INT,
    year       INT,
    quantity   INT,
    price      INT,
    PRIMARY KEY (sale_id, year),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Sales VALUES
(1 ,100 ,2008 ,10 ,5000),
(2 ,100 ,2009 ,12 ,5000),
(7 ,200 ,2011 ,15 ,9000);

SELECT * FROM Sales;


# TABLE 2

CREATE TABLE IF NOT EXISTS Product 
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(30)
);

INSERT INTO Product VALUES
(100 ,'Nokia'),
(200 ,'Apple'),
(300 ,'Samsung');

SELECT * FROM product;


# -->SOLUTION

WITH FirstYearSales AS (
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM
        Sales
    GROUP BY
        product_id
)
SELECT
    f.product_id,
    f.first_year,
    s.quantity,
    s.price
FROM
    FirstYearSales AS f
JOIN
    Sales AS s
ON
    f.product_id = s.product_id AND f.first_year = s.year;









































Example 1:

Input: 
Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+ 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+
Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+
Output: 
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+ 
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+