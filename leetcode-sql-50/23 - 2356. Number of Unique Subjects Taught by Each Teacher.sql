
-- problem url: https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/description/?envType=study-plan-v2&envId=top-sql-50

select teacher_id, count(DISTINCT subject_id) as cnt
from teacher
group by teacher_id
