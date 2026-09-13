/*
Listing 3.1 Defining a schema for the five DC trips data set 
using STRING types
*/

CREATE EXTERNAL TABLE IF NOT EXISTS dc_taxi_db.dc_taxi_csv_sample_strings(
    fareamount STRING,
    origin_block_latitude STRING,
    origin_block_longitude STRING,
    destination_block_latitude STRING,
    destination_blcok_longitude STRING,
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION 's3://dc-taxi-$BUCKET_ID-$AWS_DEFAULT_REGION/samples/'
TBLPROPERTIES ('skip.header.line.count'='1');