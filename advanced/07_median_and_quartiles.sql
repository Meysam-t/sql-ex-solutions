-- Advanced 07 · Distribution statistics
-- (a) Median vs. mean PC price per maker: a large gap signals skew.
-- (b) Price quartile of every PC across the whole catalogue.
-- Techniques: PERCENTILE_CONT (window form in T-SQL), NTILE.

-- (a) Median and mean per maker
SELECT DISTINCT
    p.maker,
    COUNT(*)   OVER (PARTITION BY p.maker) AS pc_count,
    AVG(pc.price) OVER (PARTITION BY p.maker) AS mean_price,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY pc.price)
        OVER (PARTITION BY p.maker)        AS median_price
FROM Product AS p
JOIN PC      AS pc ON pc.model = p.model
ORDER BY p.maker;

-- (b) Price quartiles
SELECT
    pc.code,
    pc.model,
    pc.price,
    NTILE(4) OVER (ORDER BY pc.price) AS price_quartile
FROM PC AS pc
ORDER BY pc.price, pc.code;
