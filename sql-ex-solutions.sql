#1
SELECT model, speed, hd
FROM pc
WHERE price<500

#2
Select DISTINCT maker 
FROM product
WHERE type='printer'

#3
SELECT model, ram, screen 
FROM laptop
WHERE price>1000

#4
SELECT * 
FROM printer
WHERE color='y'

#5
SELECT model, speed, hd
FROM pc
WHERE price<600 AND (cd='12x' OR cd='24x')

#6
SELECT DISTINCT maker, speed
FROM product p JOIN laptop l
ON p.model=l.model
WHERE hd>=10

#7
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

#8
SELECT DISTINCT maker 
FROM product
WHERE type IN ('pc', 'laptop')
EXCEPT
SELECT DISTINCT maker
FROM product
WHERE type IN ('laptop')

#9
SELECT DISTINct maker 
FROM product
JOIN pc
ON product.model=pc.model
WHERE speed>=450

#10
SELECT model, price FROM printer
WHERE price IN (SELECT MAX(price) FROM printer)

#11
SELECT AVG(speed) 
FROM pc

#12
