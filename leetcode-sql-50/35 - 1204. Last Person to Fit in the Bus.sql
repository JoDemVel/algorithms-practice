
-- problem url: https://leetcode.com/problems/last-person-to-fit-in-the-bus/description/?envType=study-plan-v2&envId=top-sql-50

WITH weights AS(
    SELECT
        person_id,
        person_name,
        weight,
        turn,
        SUM(weight) OVER (ORDER BY turn) total_weight
    FROM queue
)

SELECT person_name
FROM weights
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1
