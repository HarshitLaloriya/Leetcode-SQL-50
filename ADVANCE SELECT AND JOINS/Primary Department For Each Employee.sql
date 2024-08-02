-- Active: 1722003249103@@127.0.0.1@5432@leetcode@x1
CREATE TABLE IF NOT EXISTS  Employee
(
    employee_id    INT,
    department_id  INT,
    primary_flag   VARCHAR(30),
    PRIMARY KEY (employee_id, department_id),
    CHECK(primary_flag IN ('Y', 'N'))
)

INSERT INTO employee VALUES
(1 ,1 ,'N' ),
(2 ,1 ,'Y' ),
(2 ,2 ,'N' ),
(3 ,3 ,'N' ),
(4 ,2 ,'N' ),
(4 ,3 ,'Y' ),
(4 ,4 ,'N' );

SELECT * FROM employee;


# --> SOLUTION

WITH firstRow AS 
(
    SELECT
        ROW_NUMBER() OVER(PARTITION BY employee_id ORDER BY primary_flag DESC) AS row_num,
        COUNT(employee_id) OVER(PARTITION BY employee_id) AS cnt,
        * 
    FROM 
        employee
)
SELECT 
    employee_id,
    department_id
FROM 
    firstRow
WHERE 
    row_num = 1 
    AND
    (primary_flag = 'Y' OR cnt = 1) ;


























































Example 1:

Input: 
Employee table:
+-------------+---------------+--------------+
| employee_id | department_id | primary_flag |
+-------------+---------------+--------------+
| 1           | 1             | N            |
| 2           | 1             | Y            |
| 2           | 2             | N            |
| 3           | 3             | N            |
| 4           | 2             | N            |
| 4           | 3             | Y            |
| 4           | 4             | N            |
+-------------+---------------+--------------+
Output: 
+-------------+---------------+
| employee_id | department_id |
+-------------+---------------+
| 1           | 1             |
| 2           | 1             |
| 3           | 3             |
| 4           | 3             |
+-------------+---------------+
Explanation: 
- The Primary department for employee 1 is 1.
- The Primary department for employee 2 is 1.
- The Primary department for employee 3 is 3.
- The Primary department for employee 4 is 3.