
-- Problem url: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/?envType=study-plan-v2&envId=top-sql-50

WITH ManagerReports AS
(
    select managerId, count(1) as total
    from employee
    where managerId IS NOT NULL
    group by managerId
)

select e.name
from employee as e
join ManagerReports t on e.id = t.managerId
where t.total >= 5
