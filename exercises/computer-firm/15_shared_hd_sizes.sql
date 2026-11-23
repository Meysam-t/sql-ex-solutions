-- Exercise 15 · Computer firm
-- Hard-drive sizes that occur in two or more PCs.

SELECT hd
FROM PC
GROUP BY hd
HAVING COUNT(*) >= 2;
