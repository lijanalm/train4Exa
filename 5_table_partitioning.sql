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
-------------------------------

#Loading Data with Dynamic Partition
#Dynamic partitioning automatically defines partitions when you load the data, using the values in the partition column.
#The partition columns must be the rightmost columns in the data you are inserting, and they must be in the same order as they appear in the PARTITION clause.
INSERT OVERWRITE TABLE customers_by_country 
  PARTITION(country)
  SELECT cust_id, name, country FROM customers;

#Hive includes a safety feature that prevents users from accidental dynamic partitioning. You can disable this safety feature in Hive by setting the property:
SET hive.exec.dynamic.partition.mode=nonstrict;
-------------------------------

#Loading Data with Static Partitioning
#In static partitioning you manually define the different partitions by using an ALTER TABLE … ADD PARTITION statement, and then load the data into the partition. 
ALTER TABLE customers_by_country ADD PARTITION (country='pk');

INSERT OVERWRITE TABLE customers_by_country 
  PARTITION(country='pk')
  SELECT cust_id, name FROM customers WHERE country='pk'
