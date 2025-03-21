
-- problem url: https://leetcode.com/problems/consecutive-numbers/description/?envType=study-plan-v2&envId=top-sql-50

WITH consecutive AS (
  SELECT
    id,
    num,
    ROW_NUMBER() OVER (ORDER BY id) - 
    ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS grouped
  FROM logs
)

SELECT DISTINCT num AS ConsecutiveNums 
FROM consecutive
GROUP BY num, grouped
HAVING COUNT(*) >= 3
