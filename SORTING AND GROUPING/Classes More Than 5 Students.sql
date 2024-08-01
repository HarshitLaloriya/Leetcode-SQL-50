CREATE TABLE IF NOT EXISTS Courses 
(
    student VARCHAR(30), 
    class VARCHAR(30),
    PRIMARY KEY(student, class)
);

INSERT INTO courses VALUES
('A' ,'Math'),
('B' ,'English'),
('C' ,'Math'),
('D' ,'Biology'),
('E' ,'Math'),
('F' ,'Computer'),
('G' ,'Math'),
('H' ,'Math'),
('I' ,'Math');

SELECT * FROM courses;


# -->SOLUTION

SELECT
    class
FROM
    courses
GROUP BY class
HAVING COUNT(*)>=5;






































































Example 1:

Input: 
Courses table:
+---------+----------+
| student | class    |
+---------+----------+
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |
+---------+----------+
Output: 
+---------+
| class   |
+---------+
| Math    |
+---------+
Explanation: 
- Math has 6 students, so we include it.
- English has 1 student, so we do not include it.
- Biology has 1 student, so we do not include it.
- Computer has 1 student, so we do not include it.