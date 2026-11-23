-- Exercise 23 · Computer firm
-- Makers producing both PCs and laptops with a speed of at least 750 MHz.

SELECT p.maker
FROM Product AS p
JOIN PC      AS pc ON pc.model = p.model
WHERE pc.speed >= 750
INTERSECT
SELECT p.maker
FROM Product AS p
JOIN Laptop  AS l ON l.model = p.model
WHERE l.speed >= 750;
