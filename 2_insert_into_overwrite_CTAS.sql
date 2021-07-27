#more about: https://www.coursera.org/learn/cloud-storage-big-data-analysis-sql/supplement/UV25d/sql-insert-statements 
#--------------------------------

#insert into (bad practice because of small files problem)
#syntax:
INSERT INTO tablename 
  VALUES
  (row1col1value,row1col2value, … ),
  (row2col1value,row2col2value, … ),
  … ;
#--------------------------------

#insert overwrite
#syntax:
INSERT OVERWRITE tablename SELECT * FROM tablename;

INSERT OVERWRITE chicago_employees
  SELECT * FROM employees WHERE office_id='b';
#--------------------------------

#CTAS: CTAS effectively combines a CREATE TABLE operation and an INSERT … SELECT operation into a single step. 
#The column names and data types for the newly created table are determined based on the names and types of the columns queried in the SELECT statement.
#syntax:
CREATE TABLE chicago_employees AS
  SELECT * FROM employees WHERE office_id='b';

#you can specity which columns to return:
CREATE TABLE chicago_employees AS
  SELECT empl_id, first_name, last_name, salary 
    FROM employees 
    WHERE office_id='b';

#spec properties of the cable go before the AS keyword:
CREATE TABLE chicago_employees
  ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
  AS
  SELECT * FROM employees WHERE office_id='b';




