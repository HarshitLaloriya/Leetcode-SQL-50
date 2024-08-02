CREATE TABLE IF NOT EXISTS logs
(id SERIAL PRIMARY KEY, num VARCHAR(100));

INSERT INTO logs VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 1),
(6, 2),
(7, 2);

INSERT INTO logs VALUES (8,2);

SELECT * FROM logs;


# --> SOLUTION

# METHOD 1
SELECT DISTINCT
    l1.num AS ConsecutiveNums
FROM
    logs AS l1
JOIN
logs AS l2
ON 
(l1.id+1 = l2.id
AND 
l1.num =l2.num)
JOIN 
logs AS l3
ON
(l1.id+2 = l3.id
AND l1.num =l3.num)
;



# METHOD 2
WITH ConsecutiveNums AS (
    SELECT
        num,
        LEAD(num, 1) OVER (ORDER BY id) AS next_num1,
        LEAD(num, 2) OVER (ORDER BY id) AS next_num2
    FROM logs
)
SELECT DISTINCT
    num AS ConsecutiveNums
FROM
    ConsecutiveNums
WHERE
    num = next_num1
    AND num = next_num2;














































Example 1:

Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.