CREATE TABLE IF NOT EXISTS Employee1 (id INT PRIMARY KEY, name VARCHAR(30), department VARCHAR(1), managerID INT);

INSERT INTO Employee1 VALUES
(101,'John', 'A', NULL),
(102,'Dan', 'A', 101),
(103,'James', 'A', 101),
(104,'Amy', 'A', 101),
(105,'Anee', 'A', 101),
(106,'Ron', 'B', 101);

SELECT * FROM Employee1;


# --> Solution

SELECT emp1.name
FROM Employee1 as emp1
JOIN Employee1 AS emp2
ON emp1.id = emp2.managerid
GROUP BY emp1.name
HAVING COUNT(*)>=5;















































































Example 1:

Input: 
Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+

Output: 
+------+
| name |
+------+
| John |
+------+