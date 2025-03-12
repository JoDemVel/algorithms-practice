
-- problem url: https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/?envType=study-plan-v2&envId=top-sql-50

select
    e1.employee_id,
    e1.name,
    count(1) as reports_count,
    ROUND(avg(e2.age)) as average_age
from employees e1
inner join employees e2
    on e1.employee_id = e2.reports_to
group by e1.employee_id, e1.name
order by e1.employee_id
