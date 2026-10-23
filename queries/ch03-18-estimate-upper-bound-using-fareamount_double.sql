/*
Estimate upper bound on fare amount
*/
WITH dc_taxi AS
(SELECT *,
    origindatetime_tr
    || fareamount_string
    || origin_block_latitude_string
    || origin_block_longitude_string
    || destination_block_latitude_string
    || destination_block_longitude_string
    || mileage_string AS objectid
    
    FROM "dc_taxi_db"."dc_taxi_parquet"
    
    WHERE fareamount_double >= 3.25
            AND fareamount_double IS NOT NULL
            AND mileage_double > 0 ),

dc_taxi_samples AS (
    SELECT AVG(fareamount_double) AS average_fareamount
    FROM dc_taxi
    WHERE objectid IS NOT NULL
    GROUP BY
        MOD( ABS( from_big_endian_64( xxhash64( to_utf8( objectid ) ) ) ), 1000)
)
SELECT AVG(average_fareamount) + 4 * STDDEV(average_fareamount)
FROM dc_taxi_samples