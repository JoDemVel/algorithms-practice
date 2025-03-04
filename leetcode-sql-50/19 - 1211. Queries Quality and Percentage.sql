
-- problem url: https://leetcode.com/problems/queries-quality-and-percentage/?envType=study-plan-v2&envId=top-sql-50

select
    query_name,
    ROUND(avg(rating::float / position)::numeric, 2) as quality,
    ROUND(avg((rating < 3)::int * 100)::numeric, 2) as poor_query_percentage
from queries q
group by query_name
