-- Exercise 5 · Computer firm
-- Model, speed, and hard-drive size of PCs under $600 with a 12x or 24x CD drive.

SELECT model, speed, hd
FROM PC
WHERE price < 600
  AND cd IN ('12x', '24x');
