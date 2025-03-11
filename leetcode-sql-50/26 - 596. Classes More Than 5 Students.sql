
-- problem url: https://leetcode.com/problems/classes-more-than-5-students/description/?envType=study-plan-v2&envId=top-sql-50

select class
from courses
group by class
having count(1) >= 5
