CREATE TYPE y_OR_n AS ENUM('Y', 'N');

CREATE TABLE IF NOT EXISTS Products (product_id INT PRIMARY KEY, low_fat Y_or_N, recyclable y_OR_n);

INSERT INTO Products VALUES
(0, 'Y' ,'N' ),
(1, 'Y' ,'Y' ),
(2, 'N' ,'Y' ),
(3, 'Y' ,'Y' ),
(4, 'N' ,'N' );

SELECT * FROM Products;


# --> Solution

SELECT product_id FROM products
WHERE low_fats='Y' AND recyclable='Y';


















































































Example 1:

Input: 
Products table:
+-------------+----------+------------+
| product_id  | low_fats | recyclable |
+-------------+----------+------------+
| 0           | Y        | N          |
| 1           | Y        | Y          |
| 2           | N        | Y          |
| 3           | Y        | Y          |
| 4           | N        | N          |
+-------------+----------+------------+
Output: 
+-------------+
| product_id  |
+-------------+
| 1           |
| 3           |
+-------------+
Explanation: Only products 1 and 3 are both low fat and recyclable.