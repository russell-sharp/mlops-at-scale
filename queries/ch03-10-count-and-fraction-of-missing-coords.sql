/*
Find the count and the fraction of the missing coordinates
*/

SELECT 
    COUNT(*)
        AS total,

    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*)
                                FROM dc_taxi_db.dc_taxi_parquet), 2)
        AS percent
    
    FROM
        dc_taxi_db.dc_taxi_parquet

    WHERE
        origin_block_latitude_double IS NULL
        OR origin_block_longitude_double IS NULL
        OR destination_block_latitude_double IS NULL
        OR destination_block_longitude_double IS NULL