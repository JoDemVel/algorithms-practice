
-- problem url: https://leetcode.com/problems/immediate-food-delivery-ii/?envType=study-plan-v2&envId=top-sql-50

WITH delivery_first_order as (
    SELECT DISTINCT ON (customer_id) *
    FROM delivery
    ORDER BY customer_id, order_date
)

select
    ROUND((
        avg((order_date = customer_pref_delivery_date)::int)
    )::numeric * 100, 2) as immediate_percentage
from delivery_first_order;

-- Better solution:
SELECT 
    ROUND(
        AVG((order_date = customer_pref_delivery_date)::int) * 100, 2
    ) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (
    SELECT customer_id, MIN(order_date) 
    FROM Delivery
    GROUP BY customer_id
);
