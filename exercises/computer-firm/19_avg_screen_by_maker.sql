-- Exercise 19 · Computer firm
-- Average laptop screen size for each laptop maker.

SELECT p.maker, AVG(l.screen) AS avg_screen
FROM Product AS p
JOIN Laptop  AS l ON l.model = p.model
GROUP BY p.maker;
