CREATE TABLE IF NOT EXISTS World 
(name VARCHAR(30) PRIMARY KEY, continent VARCHAR(30), area INT, population INT, gdp BIGINT);

INSERT INTO World VALUES
('Afghanistan' ,'Asia',652230  ,25500100  , 20343000000 ),
('Albania' ,'Europe',28748   ,2831741   , 12960000000 ),
('Algeria' ,'Africa',2381741 ,37100000  , 188681000000),
('Andorra' ,'Europe',468     ,78115     , 3712000000  ),
('Angola' ,'Africa',1246700 ,20609294  , 100990000000);

SELECT * FROM World;


# --> Solution 

SELECT name, population, area FROM World
WHERE area >= 3000000 OR population >= 25000000;



















































































Example 1:

Input: 
World table:
+-------------+-----------+---------+------------+--------------+
| name        | continent | area    | population | gdp          |
+-------------+-----------+---------+------------+--------------+
| Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
| Albania     | Europe    | 28748   | 2831741    | 12960000000  |
| Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
| Andorra     | Europe    | 468     | 78115      | 3712000000   |
| Angola      | Africa    | 1246700 | 20609294   | 100990000000 |
+-------------+-----------+---------+------------+--------------+
Output: 
+-------------+------------+---------+
| name        | population | area    |
+-------------+------------+---------+
| Afghanistan | 25500100   | 652230  |
| Algeria     | 37100000   | 2381741 |
+-------------+------------+---------+