#CSV failas sukurtas ir ikeltas nuroytoj location
CREATE TABLE ExamResults
    (StudentName    STRING,
     Subject        STRING,
     Marks          INT
    )
   ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ','
    LOCATION '/user/training/ExamResults';


#ROW_Number: It assigns the sequential rank number to each unique record.
SELECT studentname, subject, marks,
     row_number() OVER(ORDER BY marks) AS RowNumber
    FROM examresults;

#RANK: It assigns the rank number to each row in a partition. It skips the number for similar values.

    
 
