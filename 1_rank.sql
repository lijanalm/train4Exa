#https://www.sqlshack.com/overview-of-sql-rank-functions/ 

#CSV file created and uploaded in location specified
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
SELECT studentname, subject, marks,
     rank() OVER(PARTITION BY studentname ORDER BY marks DESC) AS Rank
    FROM examresults
    ORDER BY studentname, Rank;
#PARTITION BY Studentname clause performs calculations on each student group



#Dense_RANK: It assigns the rank number to each row in a partition. It does not skip the number for similar values.
SELECT studentname, subject, marks,
     dense_rank() OVER(ORDER BY marks DESC) AS Rank
    FROM examresults
    ORDER BY Rank;

SELECT studentname, subject, marks,
     dense_rank() OVER(PARTITION BY subject ORDER BY marks DESC) AS Rank
    FROM examresults
    ORDER BY subject, Rank;



#NTILE(N): It divides the number of rows as per specified partition and assigns unique value in the partition.
SELECT *, ntile(2) OVER(ORDER BY marks DESC) AS rank
    FROM examresults
    ORDER BY rank;

SELECT *, ntile(2) OVER(PARTITION BY subject ORDER BY marks DESC) AS rank
    FROM examresults
    ORDER BY subject, rank;
 
