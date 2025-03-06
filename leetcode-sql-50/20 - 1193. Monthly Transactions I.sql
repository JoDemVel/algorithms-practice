
-- problem url: https://leetcode.com/problems/monthly-transactions-i/?envType=study-plan-v2&envId=top-sql-50

select
    TO_CHAR(trans_date, 'YYYY-MM') as month,
    country,
    sum((t.state is not null)::int) as trans_count,
    sum((t.state = 'approved')::int) as approved_count,
    sum(amount) as trans_total_amount,
    COALESCE(
        sum(amount) filter (where t.state = 'approved')
    , 0) as approved_total_amount
from transactions t
group by month, country
