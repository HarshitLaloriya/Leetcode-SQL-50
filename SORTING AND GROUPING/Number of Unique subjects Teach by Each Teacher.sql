CREATE TABLE IF NOT EXISTS Teacher
(
    teacher_id INT,
    subject_id INT,
    dept_id INT,
    PRIMARY KEY (subject_id, dept_id)
);


INSERT INTO teacher VALUES
(1 ,2 ,3),
(1 ,2 ,4),
(1 ,3 ,3),
(2 ,1 ,1),
(2 ,2 ,1),
(2 ,3 ,1),
(2 ,4 ,1);

SELECT * FROM teacher;


# -->Solution

# METHOD 1

SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;


# METHOD 1

WITH teacherTeached AS
(
    SELECT 
        teacher_id,
        COUNT(*) AS total_dept
    FROM 
        teacher
    GROUP BY 
        teacher_id, 
        subject_id
    ORDER BY 
        teacher_id
)
SELECT teacher_id, COUNT(*) AS cnt
FROM teacherTeached
GROUP BY teacher_id;




















































Example 1:

Input: 
Teacher table:
+------------+------------+---------+
| teacher_id | subject_id | dept_id |
+------------+------------+---------+
| 1          | 2          | 3       |
| 1          | 2          | 4       |
| 1          | 3          | 3       |
| 2          | 1          | 1       |
| 2          | 2          | 1       |
| 2          | 3          | 1       |
| 2          | 4          | 1       |
+------------+------------+---------+
Output:  
+------------+-----+
| teacher_id | cnt |
+------------+-----+
| 1          | 2   |
| 2          | 4   |
+------------+-----+
Explanation: 
Teacher 1:
  - They teach subject 2 in departments 3 and 4.
  - They teach subject 3 in department 3.
Teacher 2:
  - They teach subject 1 in department 1.
  - They teach subject 2 in department 1.
  - They teach subject 3 in department 1.
  - They teach subject 4 in department 1.