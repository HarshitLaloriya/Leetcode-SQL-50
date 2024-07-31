# TABLE 1
CREATE TABLE IF NOT EXISTS Sales 
(sale_id  INT, product_id INT, year  INT, quantity  INT, price INT,
PRIMARY KEY (sale_id, year),
FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Sales VALUES
(1 ,100 ,2008 , 10, 5000),
(2 ,100 ,2009 , 12, 5000),
(7 ,200 ,2011 , 15, 9000);

SELECT * FROM sales;


# TABLE 2
CREATE TABLE if NOT EXISTS Product
(product_id INT PRIMARY KEY,
product_name VARCHAR(30));

INSERT INTO Product VALUES
( 100, 'Nokia'),
( 200, 'Apple'),
( 300, 'Samsung');

SELECT * FROM product;


# -->Solution

SELECT p.product_name, s.year , s.price
FROM Sales AS s
JOIN Product AS p 
USING(product_id);
































































 

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
+--------------+-------+-------+
| product_name | year  | price |
+--------------+-------+-------+
| Nokia        | 2008  | 5000  |
| Nokia        | 2009  | 5000  |
| Apple        | 2011  | 9000  |
+--------------+-------+-------+
Explanation: 
From sale_id = 1, we can conclude that Nokia was sold for 5000 in the year 2008.
From sale_id = 2, we can conclude that Nokia was sold for 5000 in the year 2009.
From sale_id = 7, we can conclude that Apple was sold for 9000 in the year 2011.