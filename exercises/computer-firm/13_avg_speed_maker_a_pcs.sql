-- Exercise 13 · Computer firm
-- Average speed of PCs made by maker A.

SELECT AVG(pc.speed) AS avg_speed
FROM PC      AS pc
JOIN Product AS p ON p.model = pc.model
WHERE p.maker = 'A';
