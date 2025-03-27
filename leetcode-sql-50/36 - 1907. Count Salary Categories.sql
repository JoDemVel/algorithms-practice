
-- problem url: https://leetcode.com/problems/count-salary-categories/description/?envType=study-plan-v2&envId=top-sql-50

WITH categories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
),
salary_counts AS (
    SELECT
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category,
        COUNT(1) AS accounts_count
    FROM accounts
    GROUP BY
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END
)
SELECT c.category, COALESCE(s.accounts_count, 0) AS accounts_count
FROM categories c
LEFT JOIN salary_counts s ON c.category = s.category;

