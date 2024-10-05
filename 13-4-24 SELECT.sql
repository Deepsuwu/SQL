SELECT SD.Rollno, SD.StudName, CD.ClassName, MD.Total_Marks,
    CASE
        WHEN MD.Total_Marks >= 50 THEN 'P'
        ELSE 'F'
    END AS Grade
FROM 
    [dbo].tbl_student_Details AS SD
INNER JOIN 
    [dbo].tbl_MarksDetails AS MD ON SD.Rollno = MD.RollNO
INNER JOIN 
    dbo.tbl_ClassDetails AS CD ON MD.ClassID = CD.ClassID;

UPDATE [dbo].tbl_MarksDetails
SET Grace_Total_Marks  = -300 
WHERE RollNO = 1