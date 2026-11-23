-- Exercise 21 · Computer firm
-- Highest PC price for each maker that produces PCs.

SELECT p.maker, MAX(pc.price) AS max_price
FROM Product AS p
JOIN PC      AS pc ON pc.model = p.model
GROUP BY p.maker;
