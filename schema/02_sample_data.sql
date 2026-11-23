-- Small illustrative dataset so every query in this repo can be run locally.
-- It is not the official sql-ex.ru dataset, so results will differ from the
-- site's checker.

-- ---------------------------------------------------------------- Computer firm
INSERT INTO Product (maker, model, type) VALUES
('A', '1232', 'PC'),     ('A', '1233', 'PC'),      ('A', '1276', 'Printer'),
('A', '1298', 'Laptop'), ('A', '1401', 'Printer'), ('A', '1408', 'Printer'),
('A', '1752', 'Laptop'), ('B', '1121', 'PC'),      ('B', '1750', 'Laptop'),
('C', '1321', 'Laptop'), ('D', '1288', 'Printer'), ('D', '1433', 'Printer'),
('E', '1260', 'PC'),     ('E', '1434', 'Printer'), ('E', '2112', 'PC'),
('E', '2113', 'PC');

INSERT INTO PC (code, model, speed, ram, hd, cd, price) VALUES
(1,  '1232', 500,  64,  5, '12x', 600), (2,  '1121', 750, 128, 14, '40x', 850),
(3,  '1233', 500,  64,  5, '12x', 600), (4,  '1121', 600, 128, 14, '40x', 850),
(5,  '1121', 600, 128,  8, '40x', 850), (6,  '1233', 750, 128, 20, '50x', 950),
(7,  '1232', 500,  32, 10, '12x', 400), (8,  '1232', 450,  64,  8, '24x', 350),
(9,  '1232', 450,  32, 10, '24x', 350), (10, '1260', 500,  32, 10, '12x', 350),
(11, '1233', 900, 128, 40, '40x', 980), (12, '1233', 800, 128, 20, '50x', 970);

INSERT INTO Laptop (code, model, speed, ram, hd, price, screen) VALUES
(1, '1298', 350,  32,  4,  700, 11), (2, '1321', 500,  64,  8,  970, 12),
(3, '1750', 750, 128, 12, 1200, 14), (4, '1298', 600,  64, 10, 1050, 15),
(5, '1752', 750, 128, 10, 1150, 14), (6, '1298', 450,  64, 10,  950, 12);

INSERT INTO Printer (code, model, color, type, price) VALUES
(1, '1276', 'n', 'Laser',  400), (2, '1433', 'y', 'Jet',    270),
(3, '1434', 'y', 'Jet',    290), (4, '1401', 'n', 'Matrix', 150),
(5, '1408', 'n', 'Matrix', 270), (6, '1288', 'n', 'Laser',  400);

-- ---------------------------------------------------------------- Ships
INSERT INTO Classes (class, type, country, numGuns, bore, displacement) VALUES
('Bismarck',       'bb', 'Germany',     8, 15, 42000),
('Iowa',           'bb', 'USA',         9, 16, 46000),
('Kongo',          'bc', 'Japan',       8, 14, 32000),
('North Carolina', 'bb', 'USA',        12, 16, 37000),
('Renown',         'bc', 'Gt.Britain',  6, 15, 32000),
('Revenge',        'bb', 'Gt.Britain',  8, 15, 29000),
('Tennessee',      'bb', 'USA',        12, 14, 32000),
('Yamato',         'bb', 'Japan',       9, 18, 65000);

INSERT INTO Ships (name, class, launched) VALUES
('California', 'Tennessee', 1921),      ('Haruna', 'Kongo', 1916),
('Hiei', 'Kongo', 1914),                ('Iowa', 'Iowa', 1943),
('Kirishima', 'Kongo', 1915),           ('Kongo', 'Kongo', 1913),
('Missouri', 'Iowa', 1944),             ('Musashi', 'Yamato', 1942),
('New Jersey', 'Iowa', 1943),           ('North Carolina', 'North Carolina', 1941),
('Ramillies', 'Revenge', 1917),         ('Renown', 'Renown', 1916),
('Repulse', 'Renown', 1916),            ('Revenge', 'Revenge', 1916),
('Royal Oak', 'Revenge', 1916),         ('Royal Sovereign', 'Revenge', 1916),
('South Dakota', 'North Carolina', 1941), ('Tennessee', 'Tennessee', 1920),
('Washington', 'North Carolina', 1941), ('Wisconsin', 'Iowa', 1944),
('Yamato', 'Yamato', 1941);

INSERT INTO Battles (name, date) VALUES
('North Atlantic', '19410525'), ('Guadalcanal',    '19421115'),
('North Cape',     '19431226'), ('Surigao Strait', '19441025');

INSERT INTO Outcomes (ship, battle, result) VALUES
('Bismarck', 'North Atlantic', 'sunk'),        ('Hood', 'North Atlantic', 'sunk'),
('King George V', 'North Atlantic', 'OK'),     ('Prince of Wales', 'North Atlantic', 'damaged'),
('Rodney', 'North Atlantic', 'OK'),            ('California', 'Guadalcanal', 'damaged'),
('Kirishima', 'Guadalcanal', 'sunk'),          ('South Dakota', 'Guadalcanal', 'damaged'),
('Washington', 'Guadalcanal', 'OK'),           ('Duke of York', 'North Cape', 'OK'),
('Scharnhorst', 'North Cape', 'sunk'),         ('California', 'Surigao Strait', 'OK'),
('Fuso', 'Surigao Strait', 'sunk'),            ('Tennessee', 'Surigao Strait', 'OK'),
('West Virginia', 'Surigao Strait', 'OK'),     ('Yamashiro', 'Surigao Strait', 'sunk');

-- ---------------------------------------------------------------- Recycling firm
INSERT INTO Income_o (point, date, inc) VALUES
(1, '20010322', 15000), (1, '20010323', 15000), (1, '20010324', 3400),
(1, '20010413', 5000),  (1, '20010511', 4500),  (2, '20010322', 10000),
(2, '20010324', 1500),  (3, '20010913', 11500), (3, '20011002', 18000);

INSERT INTO Outcome_o (point, date, out) VALUES
(1, '20010314', 15348), (1, '20010324', 3663),    (1, '20010326', 1221),
(1, '20010328', 2075),  (1, '20010329', 2004),    (1, '20010411', 3195.04),
(1, '20010413', 4490),  (1, '20010427', 3110),    (1, '20010511', 2530),
(2, '20010322', 1440),  (2, '20010329', 7848),    (2, '20010402', 2040),
(3, '20010913', 1500),  (3, '20010914', 2300);

INSERT INTO Income (code, point, date, inc) VALUES
(1, 1, '20010322', 15000), (2, 1, '20010323', 15000), (3, 1, '20010324', 3600),
(4, 2, '20010322', 10000), (5, 2, '20010324', 1500),  (6, 1, '20010413', 5000),
(7, 1, '20010511', 4500),  (8, 1, '20010322', 15000), (9, 2, '20010324', 1500),
(10, 1, '20010413', 5000), (11, 1, '20010324', 3400), (12, 3, '20010913', 1350),
(13, 3, '20010913', 1750), (14, 1, '20010512', 2000), (15, 1, '20010612', 3000);

INSERT INTO Outcome (code, point, date, out) VALUES
(1, 1, '20010314', 15348),  (2, 1, '20010324', 3663), (3, 1, '20010324', 1221),
(4, 1, '20010326', 2075),   (5, 1, '20010328', 2004), (6, 1, '20010411', 3195.04),
(7, 1, '20010413', 4490),   (8, 1, '20010427', 3110), (9, 1, '20010511', 2530),
(10, 2, '20010322', 1440),  (11, 2, '20010329', 7848), (12, 2, '20010402', 2040),
(13, 3, '20010913', 1500),  (14, 3, '20010914', 2300);
