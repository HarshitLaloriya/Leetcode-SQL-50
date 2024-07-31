CREATE TABLE IF NOT EXISTS Views (article_id INT, author_id INT, viewer_id INT, view_date DATE);

INSERT INTO Views VALUES
( 1 , 3 , 5 ,'2019-08-01'),
( 1 , 3 , 6 ,'2019-08-02'),
( 2 , 7 , 7 ,'2019-08-01'),
( 2 , 7 , 6 ,'2019-08-02'),
( 4 , 7 , 1 ,'2019-07-22'),
( 3 , 4 , 4 ,'2019-07-21'),
( 3 , 4 , 4 ,'2019-07-21');

SELECT * FROM Views;


# --> Solution
SELECT DISTINCT author_id as id 
FROM Views 
WHERE author_id = viewer_id;

 














































































 

Example 1:

Input: 
Views table:
+------------+-----------+-----------+------------+
| article_id | author_id | viewer_id | view_date  |
+------------+-----------+-----------+------------+
| 1          | 3         | 5         | 2019-08-01 |
| 1          | 3         | 6         | 2019-08-02 |
| 2          | 7         | 7         | 2019-08-01 |
| 2          | 7         | 6         | 2019-08-02 |
| 4          | 7         | 1         | 2019-07-22 |
| 3          | 4         | 4         | 2019-07-21 |
| 3          | 4         | 4         | 2019-07-21 |
+------------+-----------+-----------+------------+
Output: 
+------+
| id   |
+------+
| 4    |
| 7    |
+------+