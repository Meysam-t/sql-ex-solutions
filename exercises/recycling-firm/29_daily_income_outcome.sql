-- Exercise 29 · Recycling firm
-- Income and outcome per collection point per day (at most one record of each
-- per point per day). Days with only one side show NULL for the other.

SELECT
    COALESCE(i.point, o.point) AS point,
    COALESCE(i.date,  o.date)  AS date,
    i.inc,
    o.out
FROM Income_o  AS i
FULL OUTER JOIN Outcome_o AS o
  ON  o.point = i.point
  AND o.date  = i.date;
