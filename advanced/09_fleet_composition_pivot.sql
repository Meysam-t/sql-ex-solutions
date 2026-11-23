-- Advanced 09 · Pivot with conditional aggregation
-- Fleet composition by country: battleships vs. battlecruisers, total ships,
-- and the span of launch years.
-- Techniques: conditional aggregation (portable alternative to PIVOT).

SELECT
    c.country,
    COUNT(CASE WHEN c.type = 'bb' THEN 1 END) AS battleships,
    COUNT(CASE WHEN c.type = 'bc' THEN 1 END) AS battlecruisers,
    COUNT(*)                                  AS total_ships,
    MIN(s.launched)                           AS first_launched,
    MAX(s.launched)                           AS last_launched
FROM Ships   AS s
JOIN Classes AS c ON c.class = s.class
GROUP BY c.country
ORDER BY total_ships DESC, c.country;
