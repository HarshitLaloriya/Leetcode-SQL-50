CREATE TABLE IF NOT EXISTS Queries 
(query_name VARCHAR(30), 
result VARCHAR(30), 
position INT, 
rating INT,
CHECK((position BETWEEN 1 AND 500) AND (rating BETWEEN 1 AND 5)));

INSERT INTO Queries VALUES
('Dog'  ,'Golden Retriever', 1 ,5),
('Dog'  ,'German Shepherd ', 2 ,5),
('Dog'  ,'Mule', 200 ,1),
('Cat'  ,'Shirazi', 5 ,2),
('Cat'  ,'Siamese', 3 ,3),
('Cat'  ,'Sphynx', 7 ,4);

SELECT * FROM Queries;


# --> Solution

# Method 1

WITH QueryQuality AS (
    SELECT 
        query_name, 
        rating/position::NUMERIC AS rbyp
    FROM 
        Queries    
),
    PoorQuery AS(
    SELECT
        query_name, 
        /*USING CASE TO AVOID ZERO DIVISION ERROR*/
        ROUND(
            CASE 
                WHEN COUNT(*) > 0 THEN (COUNT(*) FILTER (WHERE rating < 3)::NUMERIC / COUNT(*)::NUMERIC) * 100 
                ELSE 0 
            END, 
            2
        ) AS poor_query_percentage
    FROM 
        Queries
    GROUP BY 
        query_name
)
SELECT * 
FROM
    (
        SELECT 
            query_name, 
            ROUND(AVG(rbyp),2) AS Quality
        FROM 
            QueryQuality
        GROUP BY 
            query_name
    )
NATURAL JOIN PoorQuery;


# METHOD 2

WITH QueryQuality AS (
    SELECT
        query_name,
        ROUND(AVG(rating::decimal / position), 2) AS quality
    FROM
        Queries
    GROUP BY
        query_name
),
PoorQueryCount AS (
    SELECT
        query_name,
        COUNT(*) AS total_queries,
        COUNT(*) FILTER (WHERE rating < 3) AS poor_queries
    FROM
        Queries
    GROUP BY
        query_name
),
PoorQueryPercentage AS (
    SELECT
        query_name,
        ROUND((poor_queries::decimal / total_queries) * 100, 2) AS poor_query_percentage
    FROM
        PoorQueryCount
)
SELECT
    q.query_name,
    q.quality,
    p.poor_query_percentage
FROM
    QueryQuality q
JOIN
    PoorQueryPercentage p
ON
    q.query_name = p.query_name;



Example 1:

Input: 
Queries table:
+------------+-------------------+----------+--------+
| query_name | result            | position | rating |
+------------+-------------------+----------+--------+
| Dog        | Golden Retriever  | 1        | 5      |
| Dog        | German Shepherd   | 2        | 5      |
| Dog        | Mule              | 200      | 1      |
| Cat        | Shirazi           | 5        | 2      |
| Cat        | Siamese           | 3        | 3      |
| Cat        | Sphynx            | 7        | 4      |
+------------+-------------------+----------+--------+
Output: 
+------------+---------+-----------------------+
| query_name | quality | poor_query_percentage |
+------------+---------+-----------------------+
| Dog        | 2.50    | 33.33                 |
| Cat        | 0.66    | 33.33                 |
+------------+---------+-----------------------+
Explanation: 
Dog queries quality is ((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2.50
Dog queries poor_ query_percentage is (1 / 3) * 100 = 33.33

Cat queries quality equals ((2 / 5) + (3 / 3) + (4 / 7)) / 3 = 0.66
Cat queries poor_ query_percentage is (1 / 3) * 100 = 33.33