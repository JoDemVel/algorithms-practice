
-- problem url: https://leetcode.com/problems/employees-whose-manager-left-the-company/description/?envType=study-plan-v2&envId=top-sql-50

select e.employee_id
from employees e
where
    salary < 30000 and
    e.manager_id not in (select employee_id from employees)
order by e.employee_id