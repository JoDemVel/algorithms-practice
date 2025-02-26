select
    s.user_id,
    ROUND(
        COALESCE(
            SUM(1) 
            FILTER (WHERE c.action = 'confirmed')
        , 0)::decimal / count(1)::numeric
    , 2) as confirmation_rate
from signUps s
left join confirmations c
    on c.user_id = s.user_id
group by s.user_id