-- Exercise 20 · Computer firm
-- Makers with at least three distinct PC models, and the number of models.

SELECT maker, COUNT(model) AS pc_models
FROM Product
WHERE type = 'PC'
GROUP BY maker
HAVING COUNT(model) >= 3;
