-- Create table
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

-- Copy data from csv file to postgres database
--     1. Using `ENCODING 'Latin1'` to solve the following error:
--     ERROR:  invalid byte sequence for encoding "UTF8": 0xa3
--     2. Put csv file into folder /tmp/ to solve permission error.
COPY e_commerce (InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country)
FROM
    '/tmp/e-commerce-data.csv' DELIMITER ',' CSV HEADER ENCODING 'Latin1';

SELECT
    *
FROM
    e_commerce;

