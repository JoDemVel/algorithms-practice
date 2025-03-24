
--problem url: https://leetcode.com/problems/product-price-at-a-given-date/description/?envType=study-plan-v2&envId=top-sql-50

WITH RankedPrices AS (
    SELECT 
        product_id,
        new_price,
        change_date,
        ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS row_num
    FROM products
    WHERE change_date <= '2019-08-16'
)

SELECT
    p.product_id,
    COALESCE(rp.new_price, 10) AS price
FROM
    (SELECT DISTINCT product_id FROM products) p
LEFT JOIN RankedPrices rp 
    ON rp.product_id = p.product_id
    AND rp.row_num = 1;
