/*
Query 10 rows of dc_taxi_parquet table in the dc_taxi_db database
*/
SELECT fareamount_double,
        origindatetime_tr,
        origin_block_latitude_double,
        origin_block_longitude_double,
        destination_block_latitude_double,
        destination_block_longitude_double
FROM dc_taxi_db.dc_taxi_parquet
LIMIT 10