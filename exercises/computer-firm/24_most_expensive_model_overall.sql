-- Exercise 24 · Computer firm
-- Model number(s) with the highest price across PCs, laptops, and printers.

WITH all_prices AS (
    SELECT model, price FROM PC
    UNION ALL
    SELECT model, price FROM Laptop
    UNION ALL
    SELECT model, price FROM Printer
)
SELECT DISTINCT model
FROM all_prices
WHERE price = (SELECT MAX(price) FROM all_prices);
