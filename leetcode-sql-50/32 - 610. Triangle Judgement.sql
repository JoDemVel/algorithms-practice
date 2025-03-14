
-- problem url: https://leetcode.com/problems/triangle-judgement/description/?envType=study-plan-v2&envId=top-sql-50

select 
    x,
    y,
    z,
    CASE 
        WHEN (x + y) > z AND (x + z) > y AND (y + z) > x THEN 'Yes'
        ELSE 'No'
    END AS triangle
from triangle
