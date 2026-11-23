-- Advanced 04 · Period-over-period comparison
-- Monthly income per collection point with month-over-month change.
-- LAG returns the previous *recorded* month, so the comparison is only made
-- when that month is the immediately preceding calendar month; otherwise the
-- change is NULL rather than silently comparing against an older month.
-- Techniques: DATEFROMPARTS bucketing, LAG, NULLIF-safe percentage change.

WITH monthly AS (
    SELECT
        point,
        DATEFROMPARTS(YEAR(date), MONTH(date), 1) AS month_start,
        SUM(inc)                                  AS income
    FROM Income
    GROUP BY point, DATEFROMPARTS(YEAR(date), MONTH(date), 1)
),
with_prev AS (
    SELECT
        point,
        month_start,
        income,
        LAG(month_start) OVER (PARTITION BY point ORDER BY month_start) AS prev_month,
        LAG(income)      OVER (PARTITION BY point ORDER BY month_start) AS prev_income
    FROM monthly
)
SELECT
    point,
    month_start,
    income,
    CASE WHEN prev_month = DATEADD(MONTH, -1, month_start) THEN prev_income END
        AS prev_month_income,
    CASE WHEN prev_month = DATEADD(MONTH, -1, month_start)
         THEN CAST(100.0 * (income - prev_income) / NULLIF(prev_income, 0)
                   AS DECIMAL(9, 1))
    END AS mom_pct_change
FROM with_prev
ORDER BY point, month_start;
