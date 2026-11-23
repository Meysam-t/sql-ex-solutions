-- Advanced 02 · Top-N per group
-- The two cheapest PCs offered by each maker. Ties are broken by item code
-- so the result is deterministic.
-- Techniques: ROW_NUMBER for top-N per partition.

WITH ranked AS (
    SELECT
        p.maker,
        pc.code,
        pc.model,
        pc.speed,
        pc.ram,
        pc.price,
        ROW_NUMBER() OVER (PARTITION BY p.maker ORDER BY pc.price, pc.code) AS rn
    FROM Product AS p
    JOIN PC      AS pc ON pc.model = p.model
)
SELECT maker, model, speed, ram, price, rn AS price_position
FROM ranked
WHERE rn <= 2
ORDER BY maker, rn;
