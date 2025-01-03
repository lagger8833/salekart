-- Creates Calendar View
CREATE VIEW gold.calendar 
AS
SELECT * FROM OPENROWSET(
    BULK 'https://salekartdatawarehouse.blob.core.windows.net/silver/calendar/',
    FORMAT='PARQUET'
    ) AS calendar

-- Creates Calendar View
CREATE VIEW gold.customers 
AS
SELECT * FROM OPENROWSET(
    BULK 'https://salekartdatawarehouse.blob.core.windows.net/silver/customers/',
    FORMAT='PARQUET'
    ) AS customers

-- Creates Calendar View
CREATE VIEW gold.products 
AS
SELECT * FROM OPENROWSET(
    BULK 'https://salekartdatawarehouse.blob.core.windows.net/silver/products/',
    FORMAT='PARQUET'
    ) AS products

-- Creates Calendar View
CREATE VIEW gold.productCategories 
AS
SELECT * FROM OPENROWSET(
    BULK 'https://salekartdatawarehouse.blob.core.windows.net/silver/product-categories/',
    FORMAT='PARQUET'
    ) AS productCategories

-- Creates Calendar View
CREATE VIEW gold.productSubcategories 
AS
SELECT * FROM OPENROWSET(
    BULK 'https://salekartdatawarehouse.blob.core.windows.net/silver/product-subcategories/',
    FORMAT='PARQUET'
    ) AS productSubcategories

-- Creates Calendar View
CREATE VIEW gold.returns 
AS
SELECT * FROM OPENROWSET(
    BULK 'https://salekartdatawarehouse.blob.core.windows.net/silver/returns/',
    FORMAT='PARQUET'
    ) AS returns

-- Creates Calendar View
CREATE VIEW gold.sales 
AS
SELECT * FROM OPENROWSET(
    BULK 'https://salekartdatawarehouse.blob.core.windows.net/silver/sales/',
    FORMAT='PARQUET'
    ) AS sales

-- Creates Calendar View
CREATE VIEW gold.territories 
AS
SELECT * FROM OPENROWSET(
    BULK 'https://salekartdatawarehouse.blob.core.windows.net/silver/territories/',
    FORMAT='PARQUET'
    ) AS territories



