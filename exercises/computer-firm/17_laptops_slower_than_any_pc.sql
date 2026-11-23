-- Exercise 17 · Computer firm
-- Laptops slower than the slowest PC: type, model, speed.

SELECT DISTINCT p.type, l.model, l.speed
FROM Laptop  AS l
JOIN Product AS p ON p.model = l.model
WHERE l.speed < (SELECT MIN(speed) FROM PC);
