-- Exercise 9 · Computer firm
-- Makers of PCs with a processor speed of at least 450 MHz.

SELECT DISTINCT p.maker
FROM Product AS p
JOIN PC      AS pc ON pc.model = p.model
WHERE pc.speed >= 450;
