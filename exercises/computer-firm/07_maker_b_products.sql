-- Exercise 7 · Computer firm
-- Models and prices of every product (any type) made by maker B.

SELECT pc.model, pc.price
FROM PC AS pc
JOIN Product AS p ON p.model = pc.model
WHERE p.maker = 'B'
UNION
SELECT l.model, l.price
FROM Laptop AS l
JOIN Product AS p ON p.model = l.model
WHERE p.maker = 'B'
UNION
SELECT pr.model, pr.price
FROM Printer AS pr
JOIN Product AS p ON p.model = pr.model
WHERE p.maker = 'B';
