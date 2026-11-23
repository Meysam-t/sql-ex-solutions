-- Schemas of the three sql-ex.ru training databases (SQL Server / T-SQL).
-- Run this first, then 02_sample_data.sql.

-- ---------------------------------------------------------------- Computer firm
CREATE TABLE Product (
    maker VARCHAR(10) NOT NULL,
    model VARCHAR(50) NOT NULL PRIMARY KEY,
    type  VARCHAR(50) NOT NULL              -- 'PC' | 'Laptop' | 'Printer'
);

CREATE TABLE PC (
    code  INT         NOT NULL PRIMARY KEY,
    model VARCHAR(50) NOT NULL REFERENCES Product (model),
    speed SMALLINT    NOT NULL,             -- MHz
    ram   SMALLINT    NOT NULL,             -- MB
    hd    REAL        NOT NULL,             -- GB
    cd    VARCHAR(10) NOT NULL,             -- e.g. '24x'
    price MONEY       NULL
);

CREATE TABLE Laptop (
    code   INT         NOT NULL PRIMARY KEY,
    model  VARCHAR(50) NOT NULL REFERENCES Product (model),
    speed  SMALLINT    NOT NULL,
    ram    SMALLINT    NOT NULL,
    hd     REAL        NOT NULL,
    price  MONEY       NULL,
    screen TINYINT     NOT NULL             -- inches
);

CREATE TABLE Printer (
    code  INT         NOT NULL PRIMARY KEY,
    model VARCHAR(50) NOT NULL REFERENCES Product (model),
    color CHAR(1)     NOT NULL,             -- 'y' | 'n'
    type  VARCHAR(10) NOT NULL,             -- 'Laser' | 'Jet' | 'Matrix'
    price MONEY       NULL
);

-- ---------------------------------------------------------------- Ships
CREATE TABLE Classes (
    class        VARCHAR(50) NOT NULL PRIMARY KEY,
    type         VARCHAR(2)  NOT NULL,      -- 'bb' battleship | 'bc' battlecruiser
    country      VARCHAR(20) NOT NULL,
    numGuns      TINYINT     NULL,
    bore         REAL        NULL,          -- inches
    displacement INT         NULL           -- tons
);

CREATE TABLE Ships (
    name     VARCHAR(50) NOT NULL PRIMARY KEY,
    class    VARCHAR(50) NOT NULL REFERENCES Classes (class),
    launched SMALLINT    NULL
);

CREATE TABLE Battles (
    name VARCHAR(20) NOT NULL PRIMARY KEY,
    date DATETIME    NOT NULL
);

-- Outcomes.ship is deliberately not a foreign key: ships that fought may be
-- missing from Ships.
CREATE TABLE Outcomes (
    ship   VARCHAR(50) NOT NULL,
    battle VARCHAR(20) NOT NULL REFERENCES Battles (name),
    result VARCHAR(10) NOT NULL,            -- 'sunk' | 'damaged' | 'OK'
    PRIMARY KEY (ship, battle)
);

-- ---------------------------------------------------------------- Recycling firm
-- *_o tables: at most one record per point per day.
CREATE TABLE Income_o (
    point TINYINT  NOT NULL,
    date  DATETIME NOT NULL,
    inc   MONEY    NOT NULL,
    PRIMARY KEY (point, date)
);

CREATE TABLE Outcome_o (
    point TINYINT  NOT NULL,
    date  DATETIME NOT NULL,
    out   MONEY    NOT NULL,
    PRIMARY KEY (point, date)
);

-- Income / Outcome: any number of records per point per day.
CREATE TABLE Income (
    code  INT      NOT NULL PRIMARY KEY,
    point TINYINT  NOT NULL,
    date  DATETIME NOT NULL,
    inc   MONEY    NOT NULL
);

CREATE TABLE Outcome (
    code  INT      NOT NULL PRIMARY KEY,
    point TINYINT  NOT NULL,
    date  DATETIME NOT NULL,
    out   MONEY    NOT NULL
);
