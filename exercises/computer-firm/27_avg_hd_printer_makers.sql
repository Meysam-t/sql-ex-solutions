-- Exercise 27 · Computer firm
-- Average PC hard-drive size for each maker that also produces printers.

SELECT p.maker, AVG(pc.hd) AS avg_hd
FROM Product AS p
JOIN PC      AS pc ON pc.model = p.model
WHERE p.maker IN (SELECT maker FROM Product WHERE type = 'Printer')
GROUP BY p.maker;
