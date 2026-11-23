-- Exercise 16 · Computer firm
-- Pairs of PC models with the same speed and RAM. Each pair appears once,
-- with the higher model number first.

SELECT DISTINCT
    p1.model AS model_1,
    p2.model AS model_2,
    p1.speed,
    p1.ram
FROM PC AS p1
JOIN PC AS p2
  ON  p1.speed = p2.speed
  AND p1.ram   = p2.ram
  AND p1.model > p2.model;   -- strict ">" drops self-pairs and mirrored duplicates
