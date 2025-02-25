
-- Problem url: https://leetcode.com/problems/article-views-i/?envType=study-plan-v2&envId=top-sql-50

select vi.author_id as id
from views vi
where vi.author_id = vi.viewer_id
group by vi.author_id
order by vi.author_id
