
-- problem url: https://leetcode.com/problems/game-play-analysis-iv/submissions/1566487574/?envType=study-plan-v2&envId=top-sql-50
-- BEATS: 95.69% of mysql submissions (as of 2025-03-07)
-- REALLY IS 95.69%???. YES

WITH dates AS (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS row_num
    FROM activity
), twoDates AS (
    SELECT *
    FROM dates
    WHERE row_num <= 2
), players AS (
    select a.player_id, a.device_id, a.event_date, td.event_date, a.games_played, td.device_id
    from activity a
    join twoDates td 
        on td.player_id = a.player_id 
        and td.event_date != a.event_date
        and td.event_date = a.event_date + INTERVAL '1 day'
), total_players AS (
    SELECT COUNT(DISTINCT player_id) AS total
    FROM activity
), total_players_date AS (
    SELECT COUNT(player_id) as total
    FROM players
)

SELECT 
    ROUND((
        (SELECT total from total_players_date)::float / (SELECT total from total_players)
    )::numeric, 2) as fraction