CREATE TYPE onoff AS ENUM('start','end');

CREATE TABLE Activity (
    machine_id INT,
    process_id INT,
    activity_type onoff NOT NULL,
    timestamp FLOAT,
    PRIMARY KEY(machine_id, process_id, activity_type) 
);


INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES
(0, 0, 'start', 0.712),
(0, 0, 'end', 1.520),
(0, 1, 'start', 3.140),
(0, 1, 'end', 4.120),
(1, 0, 'start', 0.550),
(1, 0, 'end', 1.550),
(1, 1, 'start', 0.430),
(1, 1, 'end', 1.420),
(2, 0, 'start', 4.100),
(2, 0, 'end', 4.512),
(2, 1, 'start', 2.500),
(2, 1, 'end', 5.000);


SELECT * FROM activity;


# -->Solutions

# METHOD 1

SELECT machine_id, ROUND(CAST(AVG(interval) AS NUMERIC),3) AS processing_time
FROM
(
    SELECT A.machine_id, A.process_id, (A.timestamp - B.timestamp) AS interval
    FROM activity AS A
    JOIN activity AS B
    ON A.machine_id = B.machine_id
    AND A.process_id = B.process_id
    AND A.activity_type != B.activity_type
    AND A.activity_type !='start')
GROUP BY machine_id
ORDER BY machine_id;



# METHOD 2

WITH arranged AS 
(
    SELECT 
        machine_id,
        process_id,
        (MAX(CASE WHEN activity_type = 'end' THEN timestamp END)  - MAX(CASE WHEN activity_type = 'start' THEN timestamp END)) AS interval
    FROM Activity
    GROUP BY machine_id, process_id
    ORDER BY machine_id
)
SELECT 
    machine_id,
    ROUND(CAST(AVG(ar.interval) AS NUMERIC), 3) AS processing_time
FROM arranged AS ar
GROUP BY ar.machine_id
ORDER BY ar.machine_id;


































Example 1:

Input: 
Activity table:
+------------+------------+---------------+-----------+
| machine_id | process_id | activity_type | timestamp |
+------------+------------+---------------+-----------+
| 0          | 0          | start         | 0.712     |
| 0          | 0          | end           | 1.520     |
| 0          | 1          | start         | 3.140     |
| 0          | 1          | end           | 4.120     |
| 1          | 0          | start         | 0.550     |
| 1          | 0          | end           | 1.550     |
| 1          | 1          | start         | 0.430     |
| 1          | 1          | end           | 1.420     |
| 2          | 0          | start         | 4.100     |
| 2          | 0          | end           | 4.512     |
| 2          | 1          | start         | 2.500     |
| 2          | 1          | end           | 5.000     |
+------------+------------+---------------+-----------+
Output: 
+------------+-----------------+
| machine_id | processing_time |
+------------+-----------------+
| 0          | 0.894           |
| 1          | 0.995           |
| 2          | 1.456           |
+------------+-----------------+
Explanation: 
There are 3 machines running 2 processes each.
Machine 0's average time is ((1.520 - 0.712) + (4.120 - 3.140)) / 2 = 0.894
Machine 1's average time is ((1.550 - 0.550) + (1.420 - 0.430)) / 2 = 0.995
Machine 2's average time is ((4.512 - 4.100) + (5.000 - 2.500)) / 2 = 1.456
