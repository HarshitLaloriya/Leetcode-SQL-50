CREATE TABLE IF NOT EXISTS Tweets (tweet_Id INT PRIMARY KEY, content VARCHAR(100));

INSERT INTO Tweets VALUES
( 1 ,'Vote for Biden'),                   
( 2 ,'Let us make America great again!');

SELECT * FROM Tweets;


# -->Solution

SELECT tweet_id FROM Tweets 
WHERE LENGTH(content)>15;





















































































 

Example 1:

Input: 
Tweets table:
+----------+----------------------------------+
| tweet_id | content                          |
+----------+----------------------------------+
| 1        | Vote for Biden                   |
| 2        | Let us make America great again! |
+----------+----------------------------------+
Output: 
+----------+
| tweet_id |
+----------+
| 2        |
+----------+
Explanation: 
Tweet 1 has length = 14. It is a valid tweet.
Tweet 2 has length = 32. It is an invalid tweet.