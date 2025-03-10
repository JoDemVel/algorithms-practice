
-- problem url: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description/?envType=study-plan-v2&envId=top-sql-50

select 
    activity_date as day,
    count(DISTINCT user_id) as active_users
from activity
where activity_date <= '2019-07-27'::date 
    and ('2019-07-27'::date - activity_date) < 30
group by activity_date
