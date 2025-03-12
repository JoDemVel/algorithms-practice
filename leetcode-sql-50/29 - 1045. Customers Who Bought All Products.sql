
-- problem url: https://leetcode.com/problems/customers-who-bought-all-products/?envType=study-plan-v2&envId=top-sql-50

select customer_id
from customer
group by customer_id
having array_agg(product_key) @> (
    select array_agg(product_key)
    from product
)
