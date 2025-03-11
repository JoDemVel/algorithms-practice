
-- problem url: https://leetcode.com/problems/biggest-single-number/description/?envType=study-plan-v2&envId=top-sql-50

-- # BETTER
select max(num) as num
from (
    select num
    from MyNumbers
    group by num
    having count(1) = 1
)

-- # WELL
-- select max(num) as num
-- from MyNumbers
-- where num in (
--     select num
--     from MyNumbers
--     group by num
--     having count(1) = 1
-- )

-- # WORST
-- WITH numbers AS (
--     select num, count(1) as qty
--     from MyNumbers
--     group by num
-- )
-- select max(mn.num) as num
-- from MyNumbers mn
-- join numbers n 
--     on n.num = mn.num
--     and n.qty = 1
