
-- problem url: https://leetcode.com/problems/average-selling-price/description/?envType=study-plan-v2&envId=top-sql-50

select 
    p.product_id,
    COALESCE(ROUND((
            SUM(units * price)::decimal / 
            SUM(units) filter (where units is not null)
        )::numeric
        , 2
    ), 0) as average_price 
from prices p
left join UnitsSold us
    on p.end_date >= us.purchase_date and p.start_date <= us.purchase_date
    and p.product_id = us.product_id and us.product_id is not null
group by p.product_id
