-- Exercise 12 · Computer firm
-- Average speed of laptops priced over $1000.

SELECT AVG(speed) AS avg_speed
FROM Laptop
WHERE price > 1000;
