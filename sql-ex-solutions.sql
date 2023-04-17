--1
SELECT model, speed, hd
FROM pc
WHERE price<500

--2
Select DISTINCT maker 
FROM product
WHERE type='printer'

--3
SELECT model, ram, screen 
FROM laptop
WHERE price>1000

--4
SELECT * 
FROM printer
WHERE color='y'

--5
SELECT model, speed, hd
FROM pc
WHERE price<600 AND (cd='12x' OR cd='24x')

--6
SELECT DISTINCT maker, speed
FROM product p JOIN laptop l
ON p.model=l.model
WHERE hd>=10

--7
SELECT laptop.model, price 
FROM laptop
JOIN product 
ON product.model = laptop.model
WHERE maker='B'
UNION
SELECT pc.model, price 
FROM pc
JOIN product 
ON product.model = pc.model
WHERE maker='B'
UNION
SELECT printer.model, price
FROM printer
JOIN product
ON product.model=printer.model
WHERE maker='B'

--8
SELECT DISTINCT maker 
FROM product
WHERE type IN ('pc', 'laptop')
EXCEPT
SELECT DISTINCT maker
FROM product
WHERE type IN ('laptop')

--9
SELECT DISTINct maker 
FROM product
JOIN pc
ON product.model=pc.model
WHERE speed>=450

--0
SELECT model, price FROM printer
WHERE price IN (SELECT MAX(price) FROM printer)

--11
SELECT AVG(speed) 
FROM pc

--12
SELECT AVG(speed) FROM laptop
WHERE price>1000

--13
SELECT AVG(speed)FROM pc
JOIN product
ON product.model=pc.model
WHERE maker='A'

--14
SELECT s.class, name, country
FROM ships s JOIN classes c
ON s.class=c.class
WHERE numguns>=10

--15
SELECT hd 
FROM pc
GROUP BY hd
HAVING count(*)>=2

--16
-- Solution 1
SELECT DISTINCT a.model, b.model, a.speed, a.ram 
FROM pc AS a, pc AS b
WHERE a.speed=b.speed AND a.ram=b.ram AND a.model!=b.model
AND a.model>b.model

-- Solution 2
SELECT DISTINCT
    p1.model AS model1,
    p2.model AS model2,
    p1.speed AS speed,
    p1.ram AS ram
FROM
    PC p1
JOIN
    PC p2
ON
    p1.speed = p2.speed AND
    p1.ram = p2.ram AND
    p1.model > p2.model

--17
-- Solution 1
SELECT DISTINCT type, l.model, speed
FROM laptop l JOIN product p
ON p.model=l.model
WHERE speed<(SELECT MIN(speed) FROM pc)
--Solution 2
SELECT DISTINCT p.type, l.model, l.speed 
FROM product p, laptop l, pc pc
WHERE p.type='Laptop' AND l.speed<(SELECT MIN(speed) FROM pc)

--18
SELECT DISTINCT maker, price
FROM product
JOIN printer
ON product.model=printer.model
WHERE color='y' AND price=(SELECT MIN(price) FROM printer WHERE color='y')

--19
SELECT maker, AVG(screen) AS average_screen_size
From product p JOIN laptop l
ON p.model=l.model
GROUP BY maker

--20
SELECT maker, COUNT(model) AS Count_Model
FROM product 
WHERE type='PC'
GROUP BY maker
HAVING COUNT(model)>=3

--21
SELECT maker, MAX(price) AS max_price
FROM product
JOIN pc ON product.model=pc.model
GROUP BY maker

--22
SELECT speed, AVG(price) AS avg_price 
FROM pc
WHERE speed>600
GROUP BY speed

--23
SELECT maker FROM product
JOIN pc ON product.model=pc.model
WHERE speed>=750
INTERSECT
SELECT maker FROM product
JOIN laptop ON product.model=laptop.model
WHERE speed>=750

--24
WITH a AS (SELECT model, price
FROM pc 
UNION
SELECT model, price
FROM laptop
UNION
SELECT model, price
FROM printer) 

SELECT model
FROM a
WHERE price=(SELECT MAX(price) FROM a)

--25
WITH a AS (SELECT ram, speed FROM pc WHERE ram=(SELECT MIN(ram) FROM pc))

SELECT DISTINCT maker
FROM product p JOIN printer pr
ON p.model=pr.model
WHERE maker IN (SELECT maker 
FROM product p JOIN pc
ON p.model=pc.model
WHERE ram=(SELECT MIN(ram) FROM a) 
AND speed=(SELECT MAX(speed) FROM a))

--26
SELECT AVG(price)
FROM (SELECT maker, price FROM pc
      JOIN product ON product.model=pc.model WHERE maker='A'
      UNION ALL
      SELECT maker, price FROM laptop
      JOIN product ON product.model=laptop.model WHERE maker='A')T

-- 27
SELECT maker, AVG(hd) from pc
JOIN product ON product.model=pc.model
WHERE maker IN (SELECT maker from product WHERE type='Printer')
GROUP BY maker

--28
SELECT COUNT(maker)
FROM (SELECT maker 
      FROM product 
      GROUP BY maker
      HAVING COUNT(model)=1)T

--29
SELECT i.point, i.date, inc, out
FROM income_o i LEFT JOIN  outcome_o o
      ON i.point=o.point AND i.date=o.date
UNION
SELECT o.point, o.date, inc, out
FROM income_o i RIGHT JOIN  outcome_o o
      ON i.point=o.point AND i.date=o.date
