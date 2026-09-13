/*
Find number of timestamps with NULL values in origindatetime_tr column
*/
SELECT
    (SELECT COUNT(*) FROM dc_taxi_db.dc_taxi_parquet) AS total,
    COUNT(*) AS null_origindate_time_total
FROM
    dc_taxi_db.dc_taxi_parquet
WHERE
    origindatetime_tr IS NULL