-- Advanced 05 · Gaps and islands
-- Streaks of consecutive calendar days on which each collection point
-- received income (streaks of 2+ days).
-- Techniques: date minus ROW_NUMBER is constant within a run of consecutive
-- days, so it can be used as the island key.

WITH income_days AS (
    SELECT DISTINCT point, CAST(date AS DATE) AS day
    FROM Income
),
islands AS (
    SELECT
        point,
        day,
        DATEADD(
            DAY,
            -CAST(ROW_NUMBER() OVER (PARTITION BY point ORDER BY day) AS INT),
            day
        ) AS island_key
    FROM income_days
)
SELECT
    point,
    MIN(day) AS streak_start,
    MAX(day) AS streak_end,
    COUNT(*) AS days_in_streak
FROM islands
GROUP BY point, island_key
HAVING COUNT(*) >= 2
ORDER BY point, streak_start;
