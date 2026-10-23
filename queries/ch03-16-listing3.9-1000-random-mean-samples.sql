/*
generate a thousand random samples of arithmetic means of taxi 
mileages from the data (to later compute their mean)
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
            AND mileage_double > 0 )

SELECT AVG(mileage_double) AS average_mileage
FROM dc_taxi
WHERE objectid IS NOT NULL
GROUP BY MOD( ABS( from_big_endian_64( xxhash64( to_utf8( objectid ) ) ) ), 1000)
