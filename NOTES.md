## Dataset note
Downloaded DC taxi dataset from opendata.dc.gov in 2026.
Contains 53,173,692 rows vs 67,435,888 in the book (published 2022).
Dataset appears to have been cleaned/updated since publication.
Null counts and percentages will differ from book but patterns are consistent.
SQL queries and pipeline are correct.

## Glue 4.0 vs book (Glue 2.0)
- utils.sh run_job: set --glue-version 4.0; removed empty --additional-python-modules arg
- run_job must be run from src/mlops with a bare script filename (upload and ScriptLocation otherwise disagree)
- Spark SQL: `.replace('\n', '')` glues unindented lines together, so indent FROM/WHERE