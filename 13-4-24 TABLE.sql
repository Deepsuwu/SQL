DROP TABLE IF EXISTS [DBO].tbl_student_Details
DROP TABLE IF EXISTS [DBO].tbl_ClassDetails
DROP TABLE IF EXISTS [DBO].tbl_MarksDetails


CREATE TABLE [DBO].tbl_student_Details
(
Rollno       BIGINT       NOT NULL       PRIMARY KEY   IDENTITY  ,
StudName     VARCHAR (50)                NOT NULL
);

CREATE TABLE [DBO].tbl_ClassDetails
(
ClassID    BIGINT       NOT NULL   PRIMARY KEY IDENTITY  ,
ClassName  VARCHAR(50)  NOT NULL
);

CREATE TABLE [DBO].tbl_MarksDetails
(
ID                   BIGINT     NOT NULL  PRIMARY KEY  IDENTITY,
RollNO               BIGINT,
ClassID              BIGINT,
Math_Marks           BIGINT,
English_Marks        BIGINT,
Science_Marks        BIGINT,
Grace_Total_Marks    BIGINT    DEFAULT 0,
Total_Marks          AS     (Math_Marks + English_Marks+Science_Marks + Grace_Total_Marks),
CONSTRAINT FK_STUDETAILS FOREIGN KEY (RollNO) REFERENCES [DBO].tbl_student_Details (Rollno),
CONSTRAINT FK_CLASSDETAILS FOREIGN KEY (ClassID) REFERENCES [DBO].tbl_ClassDetails (ClassID)
)

INSERT INTO [DBO].tbl_student_Details (StudName)
VALUES 
('John Doe'),
('Jane Smith'),
('Michael Johnson'),
('Emily Brown'),
('David Lee');

INSERT INTO [DBO].tbl_ClassDetails 
(ClassName)
VALUES 
('CLASS 1'),
('CLASS 2'),
('CLASS 2'),
('CLASS 3'),
('CLASS 1');


INSERT INTO [DBO].tbl_MarksDetails (RollNO, ClassID, Math_Marks, English_Marks, Science_Marks)
VALUES 
(1, 1, 90, 85, 92),
(2, 2, 88, 90, 87),
(3, 3, 95, 92, 88),
(4, 4, 85, 80, 90),
(5, 5, 92, 89, 91);

SELECT * FROM [dbo].tbl_MarksDetails
SELECT * FROM [dbo].tbl_ClassDetails
SELECT * FROM [DBO].tbl_student_Details