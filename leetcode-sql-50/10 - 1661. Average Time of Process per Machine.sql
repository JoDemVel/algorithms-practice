
-- Problem url: https://leetcode.com/problems/average-time-of-process-per-machine/?envType=study-plan-v2&envId=top-sql-50

with activity_start as (
    select machine_id, process_id, a.timestamp
    from activity a
    where activity_type = 'start'
), activity_end as (
    select machine_id, process_id, a.timestamp
    from activity a
    where activity_type = 'end'
), activity_time as (
    select act_s.machine_id, act_s.process_id, (act_e.timestamp - act_s.timestamp) as difference
    from activity_start act_s
    join activity_end act_e
        on act_s.machine_id = act_e.machine_id and
        act_s.process_id = act_e.process_id
)

select machine_id, ROUND(avg(difference)::numeric, 3) as processing_time
from activity_time
group by machine_id
