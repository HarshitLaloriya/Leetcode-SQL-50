CREATE TABLE IF NOT EXISTS Triangle
(x INT, y INT, z INT,
PRIMARY KEY (x, y, z));

INSERT INTO triangle VALUES
(13 ,15 ,30),
(10 ,20 ,15);

SELECT * FROM triangle;


# --> SOLUTION

SELECT
    *,
    CASE 
        WHEN (x+y)>z AND (y+z)>x AND (z+x)>y THEN 'Yes'
        ELSE  'No'
    END AS triangle
FROM 
    triangle;













































































 

Example 1:

Input: 
Triangle table:
+----+----+----+
| x  | y  | z  |
+----+----+----+
| 13 | 15 | 30 |
| 10 | 20 | 15 |
+----+----+----+
Output: 
+----+----+----+----------+
| x  | y  | z  | triangle |
+----+----+----+----------+
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |
+----+----+----+----------+