/*
Listing 3.8 Summary statistics for the mileage_double values
*/
SELECT
    fareamount_string,
    ROUND( MIN(mileage_double), 2) AS min,
    ROUND( APPROX_PERCENTILE(mileage_double, 0.25), 2) AS q1,
    ROUND( APPROX_PERCENTILE(mileage_double, 0.5), 2) AS q2,
    ROUND( APPROX_PERCENTILE(mileage_double, 0.75), 2) AS q3,
    ROUND( MAX(mileage_double), 2) AS max
FROM
    dc_taxi_db.dc_taxi_parquet
WHERE
    fareamount_string LIKE 'NULL'
GROUP BY
    fareamount_string
