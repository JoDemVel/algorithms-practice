
-- problem url: https://leetcode.com/problems/percentage-of-users-attended-a-contest/?envType=study-plan-v2&envId=top-sql-50

select
    r.contest_id,
    ROUND((
        count(1) * 100.0 / (select count(1) from users)
    )::numeric, 2) as percentage
from register r
group by r.contest_id
order by percentage DESC, r.contest_id ASC
