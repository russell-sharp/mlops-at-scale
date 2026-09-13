/*
Listing 3.5 How often parts of the pickup location coordinate are missing
*/
SELECT
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*)
                        FROM dc_taxi_db.dc_taxi_parquet), 2)

        AS percentage_null,

    (SELECT COUNT(*)
    FROM dc_taxi_db.dc_taxi_parquet
    WHERE origin_block_longitude_double IS NULL
    OR origin_block_latitude_double IS NULL)

        AS either_null,

    (SELECT COUNT(*)
    FROM dc_taxi_db.dc_taxi_parquet
    WHERE origin_block_longitude_double IS NULL
    AND origin_block_latitude_double IS NULL)

        AS both_null

FROM
    dc_taxi_db.dc_taxi_parquet
WHERE
    origin_block_longitude_double IS NULL
    OR origin_block_latitude_double IS NULL