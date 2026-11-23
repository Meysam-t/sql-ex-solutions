-- Exercise 8 · Computer firm
-- Makers that produce PCs but not laptops.

SELECT maker
FROM Product
WHERE type = 'PC'
EXCEPT
SELECT maker
FROM Product
WHERE type = 'Laptop';
