/*
Percentage of dataset affected by non-valid fareamount values 
*/
WITH
src AS (SELECT
            COUNT(*) AS total
        FROM
            dc_taxi_db.dc_taxi_parquet
        WHERE
            fareamount_double IS NOT NULL)

SELECT
    ROUND(100.0 * COUNT(fareamount_double) / MIN(total), 2) AS percent
FROM
    dc_taxi_db.dc_taxi_parquet, src
WHERE
    fareamount_double < 3.25
    AND fareamount_double IS NOT NULL