
-- problem url: https://leetcode.com/problems/primary-department-for-each-employee/description/?envType=study-plan-v2&envId=top-sql-50

select
    employee_id, department_id
from employee
where (employee_id, primary_flag) in (
    select employee_id, max(primary_flag)
    from employee
    group by employee_id
)
