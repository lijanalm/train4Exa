#create DB and tables: https://www.coursera.org/learn/cloud-storage-big-data-analysis-sql/supplement/bu81b/creating-databases-and-tables-with-sql

#create DB syntax:
CREATE DATABASE test;

#create table syntax:
CREATE TABLE test (
  col1  INT,
  col2  STRING,
  ...);

#external tables: dropping ext table will delete the table data from the metastore, but not the data in hdfs (different in relational databases). Hive also supports temporary tables.
CREATE EXTERNAL TABLE test (
  col1  INT,
  col2  STRING,
  ...);

#drop syntax:
DROP DATABASE test;
DROP TABLE test; 
#--------------------------------

#The ROW FORMAT Clause
CREATE TABLE jobs (id INT, title STRING, salary INT, posted TIMESTAMP)
  ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ',';

#'\t' - tab characer as a delimiter
#--------------------------------

#The STORED AS Clause
CREATE TABLE jobs_txt (id INT, title STRING, salary INT, posted TIMESTAMP)  
  STORED AS TEXTFILE;
#--------------------------------

#The LOCATION Clause
CREATE TABLE jobs_training
  (id INT, title STRING, salary INT, posted TIMESTAMP)
  LOCATION '/user/training/jobs_training/';
#--------------------------------

#IF NOT EXISTS
CREATE DATABASE IF NOT EXISTS database_name;
CREATE TABLE IF NOT EXISTS table_name;
#--------------------------------

#Cloning a Table with LIKE 
#Creates exactly the same structure as an existing table
CREATE TABLE jobs_archived LIKE jobs;
#--------------------------------

#TBLPROPERTIES
CREATE EXTERNAL TABLE tbm_sf_la_central (
 tbm STRING, 
 year SMALLINT, 
 month TINYINT, 
 day TINYINT, 
 hour TINYINT, 
 dist DOUBLE, 
 lon FLOAT, 
 lat FLOAT
 )
 ROW FORMAT DELIMITED
 FIELDS TERMINATED BY ','
 LOCATION 's3a://training-coursera2/tbm_sf_la/central/'
 TBLPROPERTIES (
 'skip.header.line.count' = '1', 
 'serialization.null.format' = '999999'
 );
#--------------------------------





  
