# TABLE 1
CREATE TABLE Students (student_id INT PRIMARY KEY, student_name varchar(30));

INSERT INTO Students VALUES
(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');

SELECT * FROM Students;


# TABLE 2
CREATE TABLE Subjects (subject_name varchar(30) PRIMARY KEY);
INSERT INTO Subjects VALUES
('Math'),
('Physics'),
('Programming');

SELECT * FROM subjects;


# TABLE 3
CREATE TABLE Examinations (student_id int, subject_name varchar(30));

INSERT INTO Examinations VALUES
(1, 'Math'),        
(1, 'Physics'),         
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1, 'Math'),      
(13, 'Math'),      
(13, 'Programming'),      
(13, 'Physics'),      
(2, 'Math'),      
(1, 'Math');

SELECT * FROM Examinations;



# -->Solutions

# Method 1

SELECT stu.student_id, stu.student_name, sub.subject_name, COUNT(ex.student_id)
FROM Students AS stu 
CROSS JOIN Subjects as sub
LEFT JOIN Examinations AS ex
ON ex.student_id = stu.student_id AND sub.subject_name = ex.subject_name
GROUP BY 1,2,3
ORDER BY stu.student_id;















































Example 1:

Input: 
Students table:
+------------+--------------+
| student_id | student_name |
+------------+--------------+
| 1          | Alice        |
| 2          | Bob          |
| 13         | John         |
| 6          | Alex         |
+------------+--------------+
Subjects table:
+--------------+
| subject_name |
+--------------+
| Math         |
| Physics      |
| Programming  |
+--------------+
Examinations table:
+------------+--------------+
| student_id | subject_name |
+------------+--------------+
| 1          | Math         |
| 1          | Physics      |
| 1          | Programming  |
| 2          | Programming  |
| 1          | Physics      |
| 1          | Math         |
| 13         | Math         |
| 13         | Programming  |
| 13         | Physics      |
| 2          | Math         |
| 1          | Math         |
+------------+--------------+
Output: 
+------------+--------------+--------------+----------------+
| student_id | student_name | subject_name | attended_exams |
+------------+--------------+--------------+----------------+
| 1          | Alice        | Math         | 3              |
| 1          | Alice        | Physics      | 2              |
| 1          | Alice        | Programming  | 1              |
| 2          | Bob          | Math         | 1              |
| 2          | Bob          | Physics      | 0              |
| 2          | Bob          | Programming  | 1              |
| 6          | Alex         | Math         | 0              |
| 6          | Alex         | Physics      | 0              |
| 6          | Alex         | Programming  | 0              |
| 13         | John         | Math         | 1              |
| 13         | John         | Physics      | 1              |
| 13         | John         | Programming  | 1              |
+------------+--------------+--------------+----------------+
Explanation: 
The result table should contain all students and all subjects.
Alice attended the Math exam 3 times, the Physics exam 2 times, and the Programming exam 1 time.
Bob attended the Math exam 1 time, the Programming exam 1 time, and did not attend the Physics exam.
Alex did not attend any exams.
John attended the Math exam 1 time, the Physics exam 1 time, and the Programming exam 1 time.