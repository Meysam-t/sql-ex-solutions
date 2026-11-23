-- Advanced 03 · Running totals
-- Daily net cash flow and running balance for each collection point, using the
-- tables that allow several transactions per day (Income, Outcome).
-- Techniques: signed UNION ALL, aggregation, cumulative SUM with a ROWS frame.

WITH flows AS (
    SELECT point, CAST(date AS DATE) AS day, inc   AS amount FROM Income
    UNION ALL
    SELECT point, CAST(date AS DATE) AS day, -o.out AS amount FROM Outcome AS o
),
daily AS (
    SELECT point, day, SUM(amount) AS net_flow
    FROM flows
    GROUP BY point, day
)
SELECT
    point,
    day,
    net_flow,
    SUM(net_flow) OVER (
        PARTITION BY point
        ORDER BY day
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_balance
FROM daily
ORDER BY point, day;
