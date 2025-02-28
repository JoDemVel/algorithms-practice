
-- problem url: https://leetcode.com/problems/project-employees-i/?envType=study-plan-v2&envId=top-sql-50

select
    p.project_id,
    ROUND(avg(e.experience_years)::numeric, 2) as average_years
from project p
join employee e 
    on e.employee_id = p.employee_id
group by project_id
