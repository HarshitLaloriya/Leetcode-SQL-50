CREATE Table IF NOT EXISTS Accounts (account_id INT PRIMARY KEY, income INT);

INSERT INTO Accounts VALUES
(3 ,108939),
(2 ,12747 ),
(8 ,87709 ),
(6 ,91796 );

SELECT * FROM Accounts;


# --> SOLUTION

WITH SalaryCounts AS (
    SELECT
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income <= 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category
    FROM
        Accounts
),
CountedCategories AS (
    SELECT
        category,
        COUNT(*) AS accounts_count
    FROM
        SalaryCounts
    GROUP BY
        category
),
AllCategories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary' AS category
    UNION ALL
    SELECT 'High Salary' AS category
)
SELECT
    ac.category,
    COALESCE(cc.accounts_count, 0) AS accounts_count
FROM
    allcategories AS ac
LEFT JOIN
    CountedCategories AS cc
ON ac.category = cc.category;





















































Example 1:

Input: 
Accounts table:
+------------+--------+
| account_id | income |
+------------+--------+
| 3          | 108939 |
| 2          | 12747  |
| 8          | 87709  |
| 6          | 91796  |
+------------+--------+
Output: 
+----------------+----------------+
| category       | accounts_count |
+----------------+----------------+
| Low Salary     | 1              |
| Average Salary | 0              |
| High Salary    | 3              |
+----------------+----------------+
Explanation: 
Low Salary: Account 2.
Average Salary: No accounts.
High Salary: Accounts 3, 6, and 8.