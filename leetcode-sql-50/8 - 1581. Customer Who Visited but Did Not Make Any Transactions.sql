
-- Problem url: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/?envType=study-plan-v2&envId=top-sql-50

select vi.customer_id, count(1) as count_no_trans
from Visits vi
left join Transactions t on t.visit_id = vi.visit_id
where t.transaction_id is null
group by vi.customer_id
