/*
Create the dc_taxi_csv_sample_double table where every value in the
trips_sample.csv file is interpreted as an SQL DOUBLE
*/
CREATE EXTERNAL TABLE IF NOT EXISTS dc_taxi_db.dc_taxi_csv_sample_double(
        fareamount DOUBLE,
        origin_block_latitude DOUBLE,
        origin_block_longitude DOUBLE,
        destination_block_latitude DOUBLE,
        destination_block_longitude DOUBLE
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION 's3://dc-taxi-$BUCKET_ID-$AWS_DEFAULT_REGION/samples/'
TBLPROPERTIES ('skip.header.line.count'='1');