/*
Estimate percentage of data excluded using upper bound estimate
*/
SELECT
    100.0 * COUNT(fareamount_double) /
        (SELECT COUNT(*)
        FROM dc_taxi_db.dc_taxi_parquet
        WHERE fareamount_double IS NOT NULL) AS percent
FROM
    dc_taxi_db.dc_taxi_parquet
WHERE (fareamount_double < 3.25 OR fareamount_double > 179.75)
        AND fareamount_double IS NOT NULL;