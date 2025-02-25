
-- Problem url: https://leetcode.com/problems/product-sales-analysis-i/?envType=study-plan-v2&envId=top-sql-50

select p.product_name, s.year, s.price
from sales as s 
join product p on s.product_id = p.product_id
