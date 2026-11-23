-- Advanced 08 · Pareto / concentration analysis
-- Which makers account for the first 80% of total catalogue value?
-- A maker is in the "core" segment if the cumulative share *before* it is
-- still under 80%, so the maker that crosses the threshold is included.
-- Techniques: cumulative SUM with explicit tie-breaking, grand total via
-- empty OVER(), segmentation with CASE.

WITH catalogue AS (
    SELECT p.maker, pc.price FROM Product AS p JOIN PC      AS pc ON pc.model = p.model
    UNION ALL
    SELECT p.maker, l.price  FROM Product AS p JOIN Laptop  AS l  ON l.model  = p.model
    UNION ALL
    SELECT p.maker, pr.price FROM Product AS p JOIN Printer AS pr ON pr.model = p.model
),
maker_value AS (
    SELECT maker, SUM(price) AS total_value
    FROM catalogue
    GROUP BY maker
),
cumulative AS (
    SELECT
        maker,
        total_value,
        SUM(total_value) OVER (ORDER BY total_value DESC, maker
                               ROWS UNBOUNDED PRECEDING) AS cumulative_value,
        SUM(total_value) OVER ()                         AS grand_total
    FROM maker_value
)
SELECT
    maker,
    total_value,
    CAST(100.0 * total_value      / grand_total AS DECIMAL(5, 1)) AS pct_of_total,
    CAST(100.0 * cumulative_value / grand_total AS DECIMAL(5, 1)) AS cumulative_pct,
    CASE WHEN cumulative_value - total_value < 0.8 * grand_total
         THEN 'Core (top 80%)'
         ELSE 'Long tail'
    END AS segment
FROM cumulative
ORDER BY total_value DESC, maker;
