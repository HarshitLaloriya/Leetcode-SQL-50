CREATE TABLE IF NOT EXISTS Employees
(
 employee_id INT PRIMARY KEY,
 name        VARCHAR(35),
 manager_id  INT,
 salary      INT
);

INSERT INTO employees VALUES
(3  ,'Mila' ,9    ,60301),
(12 ,'Antonella' ,null ,31000),
(13 ,'Emery' ,null ,67084),
(1  ,'Kalel' ,11   ,21241),
(9  ,'Mikaela' ,null ,50937),
(11 ,'Joziah' ,6    ,28485);

SELECT * FROM employees;


# --> SOLUTION

SELECT 
    employee_id
FROM
    employees
WHERE 
    manager_id NOT IN (SELECT employee_id FROM employees) AND salary<30000
ORDER BY employee_id;








































































Example 1:

Input:  
Employees table:
+-------------+-----------+------------+--------+
| employee_id | name      | manager_id | salary |
+-------------+-----------+------------+--------+
| 3           | Mila      | 9          | 60301  |
| 12          | Antonella | null       | 31000  |
| 13          | Emery     | null       | 67084  |
| 1           | Kalel     | 11         | 21241  |
| 9           | Mikaela   | null       | 50937  |
| 11          | Joziah    | 6          | 28485  |
+-------------+-----------+------------+--------+
Output: 
+-------------+
| employee_id |
+-------------+
| 11          |
+-------------+

Explanation: 
The employees with a salary less than $30000 are 1 (Kalel) and 11 (Joziah).
Kalels manager is employee 11, who is still in the company (Joziah).
Joziahs manager is employee 6, who left the company because there is no row for employee 6 as it was deleted.