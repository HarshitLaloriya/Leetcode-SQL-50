# TABLE 1
CREATE TABLE IF NOT EXISTS Employees (id INT PRIMARY KEY, name VARCHAR(30));

INSERT INTO Employees VALUES
( 1  ,'Alice'),
( 7  ,'Bob'),
( 11 ,'Meir'),
( 90 ,'Winston'),
( 3  ,'Jonathan');

SELECT * FROM Employees;


# TABLE 2
CREATE TABLE IF NOT EXISTS EmployeeUNI 
(id INT,
unique_id INT,
PRIMARY KEY(id, unique_id));

INSERT INTO EmployeeUNI VALUES
(3  , 1),
(11 , 2),
(90 , 3);

SELECT * FROM EmployeeUNI;


# -->Solution
SELECT unique_id, name FROM Employees AS emp
LEFT JOIN EmployeeUNI AS uid USING(id) ;




































































 

Example 1:

Input: 
Employees table:
+----+----------+
| id | name     |
+----+----------+
| 1  | Alice    |
| 7  | Bob      |
| 11 | Meir     |
| 90 | Winston  |
| 3  | Jonathan |
+----+----------+
EmployeeUNI table:
+----+-----------+
| id | unique_id |
+----+-----------+
| 3  | 1         |
| 11 | 2         |
| 90 | 3         |
+----+-----------+
Output: 
+-----------+----------+
| unique_id | name     |
+-----------+----------+
| null      | Alice    |
| null      | Bob      |
| 2         | Meir     |
| 3         | Winston  |
| 1         | Jonathan |
+-----------+----------+
Explanation: 
Alice and Bob do not have a unique ID, We will show null instead.
The unique ID of Meir is 2.
The unique ID of Winston is 3.
The unique ID of Jonathan is 1.