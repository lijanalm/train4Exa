#When to use:
#-- reading entire dataset takes too long
#-- queries almost always filter on partition columns
#-- reasonable number of different values for partition columns (!!!)
#-- also: when data generation or ETL process splits data by file or directory names or partition column values are not in the data itself

#Creating Partitioned Tables
#Syntax:
CREATE TABLE customers_by_country (cust_id STRING, name STRING) 
  PARTITIONED BY (country STRING)
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

#!!!Partition column must not also appear in the list of all the other columns.
#You can specify more than one partition column by using a comma-separated column list in the PARTITIONED BY clause






