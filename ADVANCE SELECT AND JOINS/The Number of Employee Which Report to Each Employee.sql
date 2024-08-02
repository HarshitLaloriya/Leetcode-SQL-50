CREATE TABLE IF NOT EXISTS Employees
(
    Employee_ID INT PRIMARY KEY,
    name VARCHAR(35),
    reports_to INT,
    age INT
)

# CASE-1
INSERT INTO Employees VALUES
(9 ,'Hercy' ,null ,43),
(6 ,'Alice' ,9    ,41),
(4 ,'Bob' ,9    ,36),
(2 ,'Winston' ,null ,37);

SELECT * FROM employees;

TRUNCATE TABLE employees;

# CASE-2
INSERT INTO Employees VALUES
(1 ,'Michael' ,null ,45),
(2 ,'Alice' ,1    ,38),
(3 ,'Bob' ,1    ,42),
(4 ,'Charlie' ,2    ,34),
(5 ,'David' ,2    ,40),
(6 ,'Eve' ,3    ,37),
(7 ,'Frank' ,null ,50),
(8 ,'Grace' ,null ,48);

SELECT * FROM employees;


# --> SOLUTION

SELECT 
    e1.employee_id,
    e1.name,
    COUNT(*) AS reports_count,
    ROUND(AVG(e2.age)) AS average_age
FROM 
    employees AS e1
JOIN 
    employees AS e2
ON
    e1.employee_id = e2.reports_to
GROUP BY
    e1.employee_id,
    e1.name
ORDER BY
    e1.employee_id;

















































Example 1:

Input: 
Employees table:
+-------------+---------+------------+-----+
| employee_id | name    | reports_to | age |
+-------------+---------+------------+-----+
| 9           | Hercy   | null       | 43  |
| 6           | Alice   | 9          | 41  |
| 4           | Bob     | 9          | 36  |
| 2           | Winston | null       | 37  |
+-------------+---------+------------+-----+
Output: 
+-------------+-------+---------------+-------------+
| employee_id | name  | reports_count | average_age |
+-------------+-------+---------------+-------------+
| 9           | Hercy | 2             | 39          |
+-------------+-------+---------------+-------------+
Explanation: Hercy has 2 people report directly to him, Alice and Bob. Their average age is (41+36)/2 = 38.5, which is 39 after rounding it to the nearest integer.
Example 2:

Input: 
Employees table:
+-------------+---------+------------+-----+ 
| employee_id | name    | reports_to | age |
|-------------|---------|------------|-----|
| 1           | Michael | null       | 45  |
| 2           | Alice   | 1          | 38  |
| 3           | Bob     | 1          | 42  |
| 4           | Charlie | 2          | 34  |
| 5           | David   | 2          | 40  |
| 6           | Eve     | 3          | 37  |
| 7           | Frank   | null       | 50  |
| 8           | Grace   | null       | 48  |
+-------------+---------+------------+-----+ 
Output: 
+-------------+---------+---------------+-------------+
| employee_id | name    | reports_count | average_age |
| ----------- | ------- | ------------- | ----------- |
| 1           | Michael | 2             | 40          |
| 2           | Alice   | 2             | 37          |
| 3           | Bob     | 1             | 37          |
+-------------+---------+---------------+-------------+