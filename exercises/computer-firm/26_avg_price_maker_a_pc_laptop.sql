-- Exercise 26 · Computer firm
-- Average price of all PCs and laptops made by maker A (one combined figure).

SELECT AVG(price) AS avg_price
FROM (
    SELECT pc.price
    FROM PC AS pc
    JOIN Product AS p ON p.model = pc.model
    WHERE p.maker = 'A'
    UNION ALL                 -- ALL keeps duplicate prices in the average
    SELECT l.price
    FROM Laptop AS l
    JOIN Product AS p ON p.model = l.model
    WHERE p.maker = 'A'
) AS maker_a_items;
