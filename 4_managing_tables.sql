#https://www.coursera.org/learn/cloud-storage-big-data-analysis-sql/supplement/1btRs/examining-table-structure

#DESCRIBE (and DESCRIBE FORMATTED)
#DESCRIBE shows what columns are in a table
DESCRIBE tablename;

#DESCRIBE FORMATTED shows additional details, including the file format and storage location of the table’s data files
DESCRIBE FORMATTED tablename;

#SHOW CREATE TABLE shows structure and properties of a table. Also reflects changes to the schema or other properties of a table after creating it.
SHOW CREATE TABLE tablename;
#---------------------------------------

#Dropping Databases and Tables
DROP DATABASE database_name;
DROP TABLE table_name;

#Adding IF EXISTS will avoid an error in the case that the database or table does not exist.
DROP DATABASE IF EXISTS database_name;
DROP TABLE IF EXISTS table_name;
#---------------------------------------

#MANAGING EXISTING TABLES: https://www.coursera.org/learn/cloud-storage-big-data-analysis-sql/supplement/QYWeM/modifying-existing-tables

#Renaming a Table
ALTER TABLE old_tablename RENAME TO new_tablename;

#Moving a Table to a Different Database
ALTER TABLE old_database.tablename RENAME TO new_database.tablename;

#!!!!!!!!!! Changing Column Name or Data Type. If you are not changing the data type, you still need to supply the type. 
#If you are not changing the column name—only the data type—then repeat the column name.
ALTER TABLE tablename CHANGE old_colname new_colname type;

#Changing Column Order (Hive only). Use CHANGE keyword just as if you were changing the column name and add either AFTER column or FIRST at the end.
ALTER TABLE tablename CHANGE col_name col_name col_type FIRST;
ALTER TABLE tablename CHANGE col_name col_name col_type AFTER col_x_name;

#Adding Columns
ALTER TABLE tablename ADD COLUMNS (col1 TYPE1,col2 TYPE2,… );

#Removing Columns (Impala only)
ALTER TABLE tablename DROP COLUMN colname; 

#Replacing All Columns - completely removes the existing list of columns and replaces it with the new list.
ALTER TABLE tablename REPLACE COLUMNS (col1 TYPE1,col2 TYPE2,… );

#Changing to an Unmanaged (External) Table
ALTER TABLE tablename SET TBLPROPERTIES('EXTERNAL'='TRUE');
#(You can also use SET TBLPROPERTIES with other properties that were not set at creation. )
