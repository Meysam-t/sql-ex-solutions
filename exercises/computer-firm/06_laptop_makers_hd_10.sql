-- Exercise 6 · Computer firm
-- For each maker of laptops with a hard drive of at least 10 GB,
-- the speed of those laptops.

SELECT DISTINCT p.maker, l.speed
FROM Product AS p
JOIN Laptop  AS l ON l.model = p.model
WHERE l.hd >= 10;
