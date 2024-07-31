CREATE TABLE Customer (id INT UNIQUE, name VARCHAR(25), referee_id INT);

INSERT INTO customer 
VALUES
(1,'Will', NULL),
(2,'Jane', NULL),
(3,'Alex', 2),
(4,'Bill', NULL),
(5,'Zack', 1),
(6,'Mark', 2);

SELECT * FROM customer;


# -->Solutions

# Method 1
SELECT name FROM customer 
WHERE referee_id IS NULL OR referee_id <> 2;


# Method 2
SELECT name FROM customer
WHERE COALESCE(referee_id,0) <>2;












































































Example 1:

Input: 
Customer table:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+
Output: 
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+