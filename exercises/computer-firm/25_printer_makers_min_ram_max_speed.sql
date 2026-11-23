-- Exercise 25 · Computer firm
-- Printer makers that also make a PC with the lowest RAM and, among those,
-- the fastest processor.

WITH min_ram_pcs AS (
    SELECT model, speed
    FROM PC
    WHERE ram = (SELECT MIN(ram) FROM PC)
),
target_pcs AS (
    SELECT model
    FROM min_ram_pcs
    WHERE speed = (SELECT MAX(speed) FROM min_ram_pcs)
)
SELECT DISTINCT p.maker
FROM Product AS p
WHERE p.type = 'Printer'
  AND p.maker IN (
      SELECT p2.maker
      FROM Product    AS p2
      JOIN target_pcs AS t ON t.model = p2.model
  );
