/*
Listing 3.6 Values of the fareamount_string column that failed to parse as doubles
*/
SELECT
    fareamount_string,
    COUNT(fareamount_string) AS rows,
    ROUND(100.0 * COUNT(fareamount_string) /
            ( SELECT COUNT(*)
            FROM dc_taxi_db.dc_taxi_parquet), 2)
        AS percent
    FROM
        dc_taxi_db.dc_taxi_parquet
    WHERE
        fareamount_double IS NULL
        AND fareamount_string IS NOT NULL
    GROUP BY 
        fareamount_string;