
-- problem url: https://leetcode.com/problems/movie-rating/?envType=study-plan-v2&envId=top-sql-50

(
    select u.name as results
    from MovieRating mr
    join users u on u.user_id = mr.user_id
    group by mr.user_id
    order by count(1) DESC, u.name ASC
    limit 1
)
UNION ALL
(
    select m.title as results
    from MovieRating mr
    join movies m on mr.movie_id = m.movie_id
    where mr.created_at >= '2020-02-01' and mr.created_at <= '2020-02-29'
    group by m.title
    order by avg(mr.rating) DESC, m.title ASC
    limit 1
)