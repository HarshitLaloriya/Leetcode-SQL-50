# TABLE 1
CREATE TABLE Employee (empID INT PRIMARY KEY, name VARCHAR(30), supervisor int, salary int);

INSERT INTO Employee VALUES
(3, 'Brad', null, 4000),
(1,'john', 3,1000),
(2,'dan', 3,2000),
(4,'thomas', 3,4000);

SELECT * FROM Employee;


# TABLE 2
CREATE TABLE Bonus (empID INT, bonus int, FOREIGN KEY (empID) REFERENCES Employee(empID));

INSERT INTO Bonus VALUES
(2,500),
(4,2000);

SELECT * FROM Bonus;



# --> Solution 

SELECT name, bonus
FROM 
(
    SELECT e.name, b.bonus
    FROM Employee AS e
    LEFT JOIN Bonus AS b
    ON e.empID = b.empID
    ORDER BY e.empID
)
WHERE COALESCE(bonus,0)<1000;

































































Example 1:

Input: 
Employee table:
+-------+--------+------------+--------+
| empId | name   | supervisor | salary |
+-------+--------+------------+--------+
| 3     | Brad   | null       | 4000   |
| 1     | John   | 3          | 1000   |
| 2     | Dan    | 3          | 2000   |
| 4     | Thomas | 3          | 4000   |
+-------+--------+------------+--------+
Bonus table:
+-------+-------+
| empId | bonus |
+-------+-------+
| 2     | 500   |
| 4     | 2000  |
+-------+-------+
Output: 
+------+-------+
| name | bonus |
+------+-------+
| Brad | null  |
| John | null  |
| Dan  | 500   |
+------+-------+