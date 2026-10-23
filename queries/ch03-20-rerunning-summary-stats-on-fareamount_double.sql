/*
Rerunning the summary statistics on the fareamount_double column
*/
WITH src AS (SELECT fareamount_double AS val
            FROM dc_taxi_db.dc_taxi_parquet
            WHERE fareamount_double IS NOT NULL
            AND fareamount_double >= 3.25
            AND fareamount_double <= 180.0),

stats AS
    (SELECT
    ROUND(MIN(val), 2) AS min,
    ROUND(APPROX_PERCENTILE(val, 0.25), 2) AS q1,
    ROUND(APPROX_PERCENTILE(val, 0.5), 2) AS q2,
    ROUND(APPROX_PERCENTILE(val, 0.75), 2) AS q3,
    ROUND(AVG(val), 2) AS mean,
    ROUND(STDDEV(val), 2) AS std,
    ROUND(MAX(val), 2) AS max
    FROM src)
SELECT min, q1, q2, q3, max, mean, std
FROM stats;