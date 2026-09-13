/*
Listing 3.3 Using STRING data type for coordinates to 
simplify browser-based use cases
*/
SELECT
origin_block_latitude || ' , ' || origin_block_longitude
    AS origin,
destination_block_latitude || ' , ' || destination_block_longitude
    AS destination
FROM
    dc_taxi_db.dc_taxi_csv_sample_strings