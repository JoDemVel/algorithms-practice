
-- Problem url: https://leetcode.com/problems/rising-temperature/?envType=study-plan-v2&envId=top-sql-50

WITH weather_lag AS (
    SELECT 
        id, 
        recordDate, 
        temperature, 
        LAG(temperature, 1) OVER (ORDER BY recordDate) AS prevTemp,
        LAG(recordDate, 1) OVER (ORDER BY recordDate) AS prevDate
    FROM weather
)
SELECT id
FROM weather_lag
WHERE recordDate = prevDate + INTERVAL '1 day'
AND temperature > prevTemp;