/*
Find the difference between the largest and the smallest amounts 
for the taxi fare in the five-row data set
*/
SELECT ROUND(MAX(fareamount) - MIN(fareamount), 2)
FROM dc_taxi_db.dc_taxi_csv_sample_double