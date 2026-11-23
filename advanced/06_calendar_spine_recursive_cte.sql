-- Advanced 06 · Recursive CTE date spine
-- A gap-free daily balance for every collection point: days with no
-- transactions appear with a net flow of 0, so the balance series is
-- continuous (ready for plotting or time-series modelling).
-- Techniques: recursive CTE calendar, CROSS JOIN for a dense panel,
-- LEFT JOIN + COALESCE, cumulative SUM.

WITH flows AS (
    SELECT point, CAST(date AS DATE) AS day, inc   AS amount FROM Income
    UNION ALL
    SELECT point, CAST(date AS DATE) AS day, -o.out AS amount FROM Outcome AS o
),
daily AS (
    SELECT point, day, SUM(amount) AS net_flow
    FROM flows
    GROUP BY point, day
),
bounds AS (
    SELECT MIN(day) AS first_day, MAX(day) AS last_day FROM daily
),
calendar AS (
    SELECT first_day AS day, last_day FROM bounds
    UNION ALL
    SELECT DATEADD(DAY, 1, day), last_day
    FROM calendar
    WHERE day < last_day
),
points AS (
    SELECT DISTINCT point FROM daily
)
SELECT
    p.point,
    c.day,
    COALESCE(d.net_flow, 0) AS net_flow,
    SUM(COALESCE(d.net_flow, 0)) OVER (
        PARTITION BY p.point
        ORDER BY c.day
        ROWS UNBOUNDED PRECEDING
    ) AS balance
FROM calendar    AS c
CROSS JOIN points AS p
LEFT JOIN daily  AS d ON d.point = p.point AND d.day = c.day
ORDER BY p.point, c.day
OPTION (MAXRECURSION 0);   -- the spine can exceed the default 100 levels
