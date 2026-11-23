-- Advanced 10 · Event sequences
-- Ships that were damaged in a battle and later fought again, with the next
-- battle they took part in.
-- Techniques: LEAD over an event history ordered by battle date.

WITH history AS (
    SELECT
        o.ship,
        o.battle,
        o.result,
        b.date,
        LEAD(o.battle) OVER (PARTITION BY o.ship ORDER BY b.date) AS next_battle,
        LEAD(b.date)   OVER (PARTITION BY o.ship ORDER BY b.date) AS next_battle_date
    FROM Outcomes AS o
    JOIN Battles  AS b ON b.name = o.battle
)
SELECT
    ship,
    battle AS damaged_in,
    date   AS damaged_on,
    next_battle,
    next_battle_date
FROM history
WHERE result = 'damaged'
  AND next_battle IS NOT NULL
ORDER BY ship, damaged_on;
