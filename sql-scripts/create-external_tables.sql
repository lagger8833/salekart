-- Steps 
-- 1. Create credential
-- 2. External data source
-- 3. External File formal

-- Master key set for database level
CREATE MASTER KEY ENCRYPTION BY PASSWORD=''

-- 1. Create credential 
CREATE DATABASE SCOPED CREDENTIAL cred_lagger
WITH IDENTITY = 'Managed Identity'

-- 2. External Data Source
-- We need two sources, one for silver container for reading data and one for gold container for writing data

CREATE EXTERNAL DATA SOURCE source_silver
WITH (LOCATION='https://salekartdatawarehouse.blob.core.windows.net/silver',
     CREDENTIAL=cred_lagger
    )

CREATE EXTERNAL DATA SOURCE target_gold
WITH (LOCATION='https://salekartdatawarehouse.blob.core.windows.net/gold',
    CREDENTIAL=cred_lagger
    )

-- 3. External File Format
CREATE EXTERNAL FILE FORMAT format_parquet
WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
    )

-- Now we have 3 prerequisites done
-- Continue with creating external tables using CETAS

CREATE EXTERNAL TABLE gold.extcalendar
WITH(
    LOCATION='extcalendar',
    DATA_SOURCE=target_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.calendar;


CREATE EXTERNAL TABLE gold.extcustomers
WITH(
    LOCATION='extcustomers',
    DATA_SOURCE=target_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.customers;


CREATE EXTERNAL TABLE gold.extproductSubcategories
WITH(
    LOCATION='extproductSubcategories',
    DATA_SOURCE=target_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.productSubcategories;


CREATE EXTERNAL TABLE gold.extproductCategories
WITH(
    LOCATION='extproductCategories',
    DATA_SOURCE=target_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.productCategories;


CREATE EXTERNAL TABLE gold.extproducts
WITH(
    LOCATION='extproducts',
    DATA_SOURCE=target_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.products;


CREATE EXTERNAL TABLE gold.extreturns
WITH(
    LOCATION='extreturns',
    DATA_SOURCE=target_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.returns;


CREATE EXTERNAL TABLE gold.extsales
WITH(
    LOCATION='extsales',
    DATA_SOURCE=target_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.sales;

CREATE EXTERNAL TABLE gold.extterritories
WITH(
    LOCATION='extterritories',
    DATA_SOURCE=target_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.territories;
