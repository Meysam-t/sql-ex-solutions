-- Exercise 18 · Computer firm
-- Makers of the cheapest color printers, with the price.

SELECT DISTINCT p.maker, pr.price
FROM Printer AS pr
JOIN Product AS p ON p.model = pr.model
WHERE pr.color = 'y'
  AND pr.price = (SELECT MIN(price) FROM Printer WHERE color = 'y');
