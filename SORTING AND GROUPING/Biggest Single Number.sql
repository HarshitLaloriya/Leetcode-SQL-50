CREATE TABLE IF NOT EXISTS MyNumbers (num INT);

# CASE-1
INSERT INTO mynumbers VALUES
(8),
(8),
(3),
(3),
(1),
(4),
(5),
(6);

SELECT * FROM MyNumbers;

TRUNCATE TABLE mynumbers;

# CASE-2
INSERT INTO mynumbers VALUES
(8),
(8),
(7),
(7),
(3),
(3),
(3);

SELECT * FROM MyNumbers;

# -->SOLUTION

# METHOD 1
WITH singleNumber AS
(
    SELECT
        num
    FROM
        MyNumbers
    GROUP BY
        num
    HAVING COUNT(*)=1
)
SELECT 
    MAX(num) AS num
FROM
    singleNumber;


# METHOD 2
WITH NumberCounts AS (
    SELECT
        num,
        COUNT(*) AS count
    FROM
        MyNumbers
    GROUP BY
        num
)
SELECT
    MAX(num) AS num
FROM
    NumberCounts
WHERE
    count = 1;




































Example 1:

Input: 
MyNumbers table:
+-----+
| num |
+-----+
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |
+-----+
Output: 
+-----+
| num |
+-----+
| 6   |
+-----+
Explanation: The single numbers are 1, 4, 5, and 6.
Since 6 is the largest single number, we return it.
Example 2:

Input: 
MyNumbers table:
+-----+
| num |
+-----+
| 8   |
| 8   |
| 7   |
| 7   |
| 3   |
| 3   |
| 3   |
+-----+
Output: 
+------+
| num  |
+------+
| null |
+------+
Explanation: There are no single numbers in the input table so we return null.