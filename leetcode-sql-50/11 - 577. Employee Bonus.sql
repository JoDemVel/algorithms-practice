
-- Problem url: https://leetcode.com/problems/employee-bonus/?envType=study-plan-v2&envId=top-sql-50

select e.name, b.bonus
from employee e
left join bonus b on e.empId = b.empId
where bonus < 1000 or bonus is null
