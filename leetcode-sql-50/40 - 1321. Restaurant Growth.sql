
-- problem url: https://leetcode.com/problems/restaurant-growth/description/?envType=study-plan-v2&envId=top-sql-50

SELECT
    date_with_index.visited_on AS visited_on,
    rolling_stats.total_amount AS amount,
    ROUND(rolling_stats.total_amount / 7.0, 2) AS average_amount
FROM (
    SELECT
        ROW_NUMBER() OVER (ORDER BY visited_on) AS row_num,
        visited_on
    FROM 
        Customer
    GROUP BY
        visited_on
) AS date_with_index
JOIN LATERAL (
    SELECT
        SUM(c.amount) AS total_amount
    FROM
        Customer c
    WHERE 
        c.visited_on BETWEEN date_with_index.visited_on - INTERVAL '6 days'
                          AND date_with_index.visited_on
) AS rolling_stats ON TRUE
WHERE 
    date_with_index.row_num > 6;