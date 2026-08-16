import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
# import AWS Glue Job to later manage job life cycle

args = getResolvedOptions(sys.argv, ['JOB_NAME',
                                     'BUCKET_SRC_PATH',
                                     'BUCKET_DST_PATH',
                                     'DST_VIEW_NAME'])

BUCKET_SRC_PATH = args['BUCKET_SRC_PATH']
BUCKET_DST_PATH = args['BUCKET_DST_PATH']
DST_VIEW_NAME = args['DST_VIEW_NAME']

sc = SparkContext()
glueContext = GlueContext(sc)
logger = glueContext.get_logger()
spark = glueContext.spark_session
spark.conf.set("spark.sql.caseSensitive", "false")
# set case insensitivity for spark backwards compatibility

job = Job(glueContext)
job.init(args['JOB_NAME'], args) # retrieve JOB_NAME parameter

df = ( spark.read.format("csv")
      .option("header", True)
      .option("inferSchema", True)
      .option("delimiter", "|")
      .load("{}".format(BUCKET_SRC_PATH)) )
# Read the CSV files located at BUCKET_SRC_PATH -> Spark DataFrame

df.createOrReplaceTempView("{}".format(DST_VIEW_NAME))

query_df = spark.sql("""
    SELECT
        origindatetime_tr,

        CAST(fareamount AS DOUBLE) AS fareamount_double,
        CAST(fareamount AS STRING) AS fareamount_string,

        origin_block_latitude,
        CAST(origin_block_latitude AS STRING) AS origin_block_latitude_string,
        
        origin_block_longitude,
        CAST(origin_block_longitude as STRING) AS origin_block_longitude_string,
                     
        destination_block_latitude,
        CAST(destination_block_latitude AS STRING)
            AS destination_block_latitude_string,
        
        destination_block_longitude,
        CAST(destination_block_longitude AS STRING)
            AS destination_block_longitude_string,
                     
        CAST(mileage AS DOUBLE) AS mileage_double,
        CAST(mileage AS STRING) AS mileage_string
    
    FROM dc_taxi_csv
                     
""".replace('\n', ''))
# Eliminate new lines in the Python multiline string of the SQL query 
# for Spark SQL compatibility

query_df.write.parquet("{}".format(BUCKET_DST_PATH), mode="overwrite")
# Save using Parquet format to the object storage location specified by
# BUCKET_DST_PATH

job.commit()