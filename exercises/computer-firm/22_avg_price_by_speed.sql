-- Exercise 22 · Computer firm
-- For each PC speed above 600 MHz, the average price of PCs at that speed.

SELECT speed, AVG(price) AS avg_price
FROM PC
WHERE speed > 600
GROUP BY speed;
