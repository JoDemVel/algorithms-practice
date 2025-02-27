
-- problem url: https://leetcode.com/problems/not-boring-movies/description/?envType=study-plan-v2&envId=top-sql-50

select c.id, c.movie, c.description, c.rating
from cinema c
where c.id % 2 != 0 and c.description != 'boring'
order by rating DESC
