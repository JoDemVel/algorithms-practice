
-- problem url: https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/?envType=study-plan-v2&envId=top-sql-50

SELECT user_id as id, SUM(total) AS num
FROM (
    SELECT requester_id AS user_id, COUNT(1) AS total
    FROM RequestAccepted
    GROUP BY requester_id
    UNION ALL
    SELECT accepter_id AS user_id, COUNT(1) AS total
    FROM RequestAccepted
    GROUP BY accepter_id
) AS combined
GROUP BY user_id
ORDER BY num DESC
LIMIT 1;