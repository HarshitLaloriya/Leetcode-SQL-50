-- Active: 1722003249103@@127.0.0.1@5432@leetcode@x
CREATE SCHEMA IF NOT EXISTS X;

CREATE TABLE IF NOT EXISTS Activity (player_id INT ,device_id  INT, event_date DATE ,games_played INT,
PRIMARY KEY(player_id, event_date))

INSERT INTO Activity VALUES
( 1, 2 ,'2016-03-01' ,5 ),
( 1, 2 ,'2016-03-02' ,6 ),
( 2, 3 ,'2017-06-25' ,1 ),
( 3, 1 ,'2016-03-02' ,0 ),
( 3, 4 ,'2018-07-03' ,5 );

SELECT * FROM Activity;


# -->Solution

WITH FirstLogins AS (
    SELECT 
        player_id,
        MIN(event_date) AS first_login_date
    FROM activity
    GROUP BY player_id
),
LoggedBackPlayers AS (
    SELECT DISTINCT
        a.player_id
    FROM 
        FirstLogins fl
    JOIN 
        activity a
    ON 
        fl.player_id = a.player_id
    AND 
        fl.first_login_date + INTERVAL '1 DAY' = a.event_date
),
TotalPlayers AS (
    SELECT 
        COUNT(DISTINCT player_id) AS total_players
    FROM 
        activity
),
TotalLoggedBackPlayers AS (
    SELECT 
        COUNT(DISTINCT player_id) AS players
    FROM 
        LoggedBackPlayers
)
SELECT 
    ROUND(players::DECIMAL / total_players, 2) AS fraction
FROM 
    TotalPlayers, TotalLoggedBackPlayers;















































Example 1:

Input: 
Activity table:
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-03-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+
Output: 
+-----------+
| fraction  |
+-----------+
| 0.33      |
+-----------+