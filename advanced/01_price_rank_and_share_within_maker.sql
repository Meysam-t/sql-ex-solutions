-- Advanced 01 · Window functions: ranking and share of total
-- Rank each maker's products by price within product type, and show each
-- product's share of the maker's total catalogue value.
-- Techniques: UNION ALL into a unified fact table, DENSE_RANK, windowed SUM.

WITH catalogue AS (
    SELECT p.maker, p.type, pc.model, pc.price
    FROM Product AS p JOIN PC AS pc ON pc.model = p.model
    UNION ALL
    SELECT p.maker, p.type, l.model, l.price
    FROM Product AS p JOIN Laptop AS l ON l.model = p.model
    UNION ALL
    SELECT p.maker, p.type, pr.model, pr.price
    FROM Product AS p JOIN Printer AS pr ON pr.model = p.model
)
SELECT
    maker,
    type,
    model,
    price,
    DENSE_RANK() OVER (PARTITION BY maker, type ORDER BY price DESC) AS price_rank,
    CAST(100.0 * price / SUM(price) OVER (PARTITION BY maker)
         AS DECIMAL(5, 1))                                            AS pct_of_maker_value
FROM catalogue
ORDER BY maker, type, price_rank;
