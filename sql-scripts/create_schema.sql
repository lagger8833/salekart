CREATE SCHEMA GOLD;
SELECT * FROM OPENROWSET(
    BULK 'https://salekartdatawarehouse.dfs.core.windows.net/silver/calendar/',
    FORMAT='PARQUET') AS query_calendar;