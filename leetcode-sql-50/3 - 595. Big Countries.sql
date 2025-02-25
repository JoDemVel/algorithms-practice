
-- Problem url: https://leetcode.com/problems/big-countries/?envType=study-plan-v2&envId=top-sql-50

select w.name, w.population, w.area
from world w
where w.population >= 25000000 or w.area >= 3000000