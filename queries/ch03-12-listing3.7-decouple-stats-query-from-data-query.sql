/*
Listing 3.7 Reusable pattern for de-coupling the statistics query from the data query
*/
WITH
src AS (SELECT
            fareamount_double AS val
        from
            dc_taxi_db.dc_taxi_parquet),

stats AS
    (SELECT
        MIN(val) AS min,
        APPROX_PERCENTILE(val, 0.25) AS q1,
        APPROX_PERCENTILE(val, 0.5) AS q2,
        APPROX_PERCENTILE(val, 0.75) AS q3,
        AVG(val) AS mean,
        STDDEV(val) AS std,
        MAX(val) AS max
    FROM
        src)

SELECT
    DISTINCT min, q1, q2, q3, max

FROM
    dc_taxi_db.dc_taxi_parquet, stats