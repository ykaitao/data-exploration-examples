SHOW datestyle;

DateStyle
-----------
ISO,
DMY (1 ROW)
ALTER DATABASE "kaggle" SET datestyle TO SQL, DMY H:M;

UPDATE
    pg_database
SET
    ENCODING = pg_char_to_encoding('SQL_ASCII')
WHERE
    datname = 'e_commerce';

CREATE TABLE IF NOT EXISTS e_commerce (
    InvoiceNo text NOT NULL,
    StockCode text,
    Description text,
    Quantity int,
    InvoiceDate text,
    UnitPrice real,
    CustomerID int,
    Country text
);

DROP TABLE IF EXISTS e_commerce;

-- ERROR:  invalid byte sequence for encoding "UTF8": 0xa3
COPY e_commerce (InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country)
FROM
    '/tmp/e-commerce-data.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

ESCAPE 'OFF';

SELECT
    *
FROM
    e_commerce;

