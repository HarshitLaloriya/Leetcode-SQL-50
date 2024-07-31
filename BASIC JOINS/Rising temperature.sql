-- Active: 1722003249103@@127.0.0.1@5432@leetcode
CREATE TABLE weather (id INT UNIQUE, recordDate DATE, temperature INT);

SELECT * FROM weather;

INSERT INTO weather 
VALUES
(1,'2015-01-1',10),
(2,'2015-01-2',25),
(3,'2015-01-3',30),
(4,'2015-01-4',20);


# -->Solution

SELECT 
    w1.id
FROM 
    Weather w1
JOIN 
    Weather w2
ON 
    w1.recordDate = w2.recordDate + INTERVAL '1 DAY'
WHERE w1.temperature > w2.temperature;


# REFERENCE HOW INTERVAL WORKS
W1 -> 2015-01-01       W2-> 2015-01-01          W2 + INTERVAL "1 DAY"-> 2015-01-02
      2015-01-02            2015-01-02                                  2015-01-03
      2015-01-03            2015-01-03                                  2015-01-04
      2015-01-04            2015-01-04                                  2015-01-05





































































Example 1:

Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).