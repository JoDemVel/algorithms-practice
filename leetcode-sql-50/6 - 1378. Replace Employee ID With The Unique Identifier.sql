
-- Problem url: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/?envType=study-plan-v2&envId=top-sql-50

select en.unique_id, e.name
from EmployeeUNI en
right join employees e on e.id = en.id
