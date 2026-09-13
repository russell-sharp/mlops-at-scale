/*
Check no. valid origindatetimes
*/
SELECT
    (SELECT COUNT(*) FROM dc_taxi_db.dc_taxi_parquet)
    - COUNT(DATE_PARSE(origindatetime_tr, '%m/%d/%Y %H:%i'))
    AS origindatetime_not_parsed
FROM
    dc_taxi_db.dc_taxi_parquet
WHERE
    origindatetime_tr IS NOT NULL;