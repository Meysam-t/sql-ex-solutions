-- Exercise 28 · Computer firm
-- Number of makers that produce exactly one model.

SELECT COUNT(*) AS makers_with_one_model
FROM (
    SELECT maker
    FROM Product
    GROUP BY maker
    HAVING COUNT(model) = 1
) AS single_model_makers;
