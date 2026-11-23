-- Exercise 14 · Ships
-- Class, name, and country of ships whose class has at least 10 guns.

SELECT s.class, s.name, c.country
FROM Ships   AS s
JOIN Classes AS c ON c.class = s.class
WHERE c.numGuns >= 10;
