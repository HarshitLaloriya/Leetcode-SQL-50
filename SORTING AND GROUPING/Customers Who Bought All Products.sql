-- Active: 1722003249103@@127.0.0.1@5432@leetcode@z
CREATE SCHEMA Z;

# TABLE-1

CREATE TABLE IF NOT EXISTS Customer
(
    customer_id INT NOT NULL,
    product_key INT,
    FOREIGN KEY (product_key) REFERENCES product(product_key)
);

INSERT INTO Customer VALUES
(1 ,5 ),
(2 ,6 ),
(3 ,5 ),
(3 ,6 ),
(1 ,6 );

SELECT * FROM Customer;


# TABLE-2

CREATE TABLE IF NOT EXISTS Product
(
    product_key INT PRIMARY KEY
);

INSERT INTO Product VALUES
(5),
(6);

SELECT * FROM Product;


# --> SOLUTION


SELECT
    customer_ID
FROM
    customer
GROUP BY
    customer_ID
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);






















































Example 1:

Input: 
Customer table:
+-------------+-------------+
| customer_id | product_key |
+-------------+-------------+
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |
+-------------+-------------+
Product table:
+-------------+
| product_key |
+-------------+
| 5           |
| 6           |
+-------------+
Output: 
+-------------+
| customer_id |
+-------------+
| 1           |
| 3           |
+-------------+
Explanation: 
The customers who bought all the products (5 and 6) are customers with IDs 1 and 3.