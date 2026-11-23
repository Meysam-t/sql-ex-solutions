-- Exercise 10 · Computer firm
-- The most expensive printer model(s) and their price.

SELECT model, price
FROM Printer
WHERE price = (SELECT MAX(price) FROM Printer);
