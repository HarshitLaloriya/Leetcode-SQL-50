CREATE TABLE IF NOT EXISTS 
Cinema (
    id INT PRIMARY KEY,
    movie VARCHAR(20), 
    description VARCHAR(20), 
    rating DECIMAL(4,2)
    );


INSERT INTO cinema VALUES
( 1 , 'War' , 'great 3D' , 8.9),
( 2 , 'Science' , 'fiction' , 8.5),
( 3 , 'irish' , 'boring' , 6.2),
( 4 , 'Ice song' , 'Fantacy' , 8.6),
( 5 , 'House card' , 'Interesting' , 9.1);

SELECT * FROM cinema;

# -->Solution

SELECT * FROM cinema
WHERE ID%2!=0 AND description != 'boring' 
ORDER BY rating DESC; 


 
 









































































Example 1:

Input: 
Cinema table:
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |
+----+------------+-------------+--------+
Output: 
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |
+----+------------+-------------+--------+
Explanation: 
We have three movies with odd-numbered IDs: 1, 3, and 5. The movie with ID = 3 is boring so we do not include it in the answer.