CREATE TABLE IF NOT EXISTS Followers
(
    user_id INT,
    follower_id INT,
    PRIMARY KEY(user_id, follower_id)
)

INSERT INTO followers VALUES
(0 ,1 ),
(1 ,0 ),
(2 ,0 ),
(2 ,1 );

SELECT * FROM followers;


# --> SOLUTION

SELECT 
    user_id,
    COUNT(follower_id) AS followerS_count
FROM
    followers
GROUP BY 
    user_id
ORDER BY
    user_id;









































































Example 1:

Input: 
Followers table:
+---------+-------------+
| user_id | follower_id |
+---------+-------------+
| 0       | 1           |
| 1       | 0           |
| 2       | 0           |
| 2       | 1           |
+---------+-------------+
Output: 
+---------+----------------+
| user_id | followers_count|
+---------+----------------+
| 0       | 1              |
| 1       | 1              |
| 2       | 2              |
+---------+----------------+
Explanation: 
The followers of 0 are {1}
The followers of 1 are {0}
The followers of 2 are {0,1}