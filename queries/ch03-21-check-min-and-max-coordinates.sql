/*
Check minimum and maximum coordinates for the origin latitude and longitude columns
*/
SELECT
    MIN(origin_block_latitude_double) AS olat_min,
    MIN(origin_block_longitude_double) AS olon_min,
    MAX(origin_block_latitude_double) AS olat_max,
    MAX(origin_block_longitude_double) AS olon_max,
    MIN(destination_block_latitude_double) AS dlat_min,
    MIN(destination_block_longitude_double) AS dlon_min,
    MAX(destination_block_latitude_double) AS dlat_max,
    MAX(destination_block_longitude_double) AS dlon_max
FROM
    dc_taxi_db.dc_taxi_parquet