/*
Listing 3.5 How often parts of the destination location coordinate are missing
*/
SELECT
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*)
                        FROM dc_taxi_db.dc_taxi_parquet), 2)

        AS percentage_null,

    (SELECT COUNT(*)
    FROM dc_taxi_db.dc_taxi_parquet
    WHERE destination_block_longitude_double IS NULL
    OR destination_block_latitude_double IS NULL)

        AS either_null,

    (SELECT COUNT(*)
    FROM dc_taxi_db.dc_taxi_parquet
    WHERE destination_block_longitude_double IS NULL
    AND destination_block_latitude_double IS NULL)

        AS both_null

FROM
    dc_taxi_db.dc_taxi_parquet
WHERE
    destination_block_longitude_double IS NULL
    OR destination_block_latitude_double IS NULL