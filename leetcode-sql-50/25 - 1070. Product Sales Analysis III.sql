
-- problem url: https://leetcode.com/problems/product-sales-analysis-iii/description/?envType=study-plan-v2&envId=top-sql-50

select product_id, year as first_year, quantity, price
from sales
where (product_id, year)
    in (
        select product_id, min(year)
        from sales
        group by product_id
    )
