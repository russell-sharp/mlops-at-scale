/*
Delineate dataset geographical bounds
*/
SELECT
    MIN(lat) AS lower_left_latitude,
    MIN(lon) AS lower_left_longitude,
    MAX(lat) AS upper_right_latitude,
    MAX(lon) AS upper_right_longitude

    FROM (
        SELECT
            MIN(origin_block_latitude_double) AS lat,
            MIN(origin_block_longitude_double) AS lon
        FROM "dc_taxi_db"."dc_taxi_parquet"

        UNION

        SELECT
            MIN(destination_block_latitude_double) AS lat,
            MIN(destination_block_longitude_double) AS lon
        FROM "dc_taxi_db"."dc_taxi_parquet"

        UNION

        SELECT
            MAX(origin_block_latitude_double) AS lat,
            MAX(origin_block_longitude_double) AS lon
        FROM "dc_taxi_db"."dc_taxi_parquet"

        UNION

        SELECT
            MAX(destination_block_latitude_double) AS lat,
            MAX(destination_block_longitude_double) AS lon
        FROM "dc_taxi_db"."dc_taxi_parquet"
    )