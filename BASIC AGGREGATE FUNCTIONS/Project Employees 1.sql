# TABLE 1
CREATE TABLE IF NOT EXISTS Project
(
    project_id INT, 
    Employee_id INT,
    PRIMARY KEY(project_id, Employee_id)
)

INSERT INTO Project VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4);

SELECT * FROM Project;


# TABLE 2
CREATE TABLE IF NOT EXISTS Employee2
(
    Employee_id INT PRIMARY KEY,
    name VARCHAR(20),
    experience_years INT NOT NULL
)

INSERT INTO Employee2 VALUES 
(1 ,'Khaled' , 3),
(2 ,'Ali' , 2),
(3 ,'John' , 1),
(4 ,'Doe' , 2);

SELECT * FROM Employee2;



# --> Solution 

SELECT pro.project_id, ROUND(AVG(Experience_years),2) AS average_years
FROM Project AS pro 
NATURAL JOIN Employee2 AS emp 
GROUP BY pro.project_id;
























































 

Example 1:

Input: 
Project table:
+-------------+-------------+
| project_id  | employee_id |
+-------------+-------------+
| 1           | 1           |
| 1           | 2           |
| 1           | 3           |
| 2           | 1           |
| 2           | 4           |
+-------------+-------------+
Employee table:
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 1                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+
Output: 
+-------------+---------------+
| project_id  | average_years |
+-------------+---------------+
| 1           | 2.00          |
| 2           | 2.50          |
+-------------+---------------+
Explanation: The average experience years for the first project is (3 + 2 + 1) / 3 = 2.00 and for the second project is (3 + 2) / 2 = 2.50