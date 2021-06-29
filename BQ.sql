/* Andy Tran
103460759
*/

/*
Subject(SubjCode, Description)
PK(SubjCode)

Teacher(StaffID, Surname, GivenName)
PK(StaffID) 

Student(StudentID, Surname, GivenName, Gender)
PK(StudentID)

SubjectOffering(SubjCode, Year, Semester, Fee, StaffID)
PK(SubjCode, Year, Semester)
FK(SubjCode) References Subject
FK(StaffID) References Teacher

Enrolment(StudentID, SubjCode, Year, Semester, DateEnrolled, Grade)\
PK(StudentID, SubjCode, Year, Semester)
FK(StudentID) References Student
FK(SubjCode, Year, Semester) References SubjectOffering

*/

 USE Marking;

 DROP TABLE IF EXISTS Enrolment, SubjectOffering, Student, Teacher, Subject;

 Create Table Subject(
     SubjCode NVARCHAR(100)
     Description NVARCHAR(500)
     PK(SubjCode)
    )

 Create Table Teacher(
     StaffID, INT
     Surname, NVARCHAR(100) NOT NULL
     GivenName NVARCHAR(100) NOT NULL
     PK(StaffID) Check_Teacher_StaffID Check( Len(StaffID) = 8 )
 ) 

 Create Table Student(
    StudentID, NVARCHAR(10)
    Surname, NVARCHAR(100) NOT NULL
    GivenName, NVARCHAR(100) NOT NULL
    Gender NVARCHAR(1) 
    PK(StudentID)
    CONSTRAINT CHECK_STUDENT_GENDER CHECK(GENDER IN ("‘M’, ‘F’, ‘I’")
 )

 Create Table SubjectOffering(
    SubjCode, NVARCHAR(100)
    Year, INT 
    Semester, INT
    Fee, MONEY
    StaffID INT
    PK(SubjCode, Year, Semester)
    FK(SubjCode) References Subject
    FK(StaffID) References Teacher
    CONSTRAINT CHECK_SUBJOFFERING_YEAR CHECK(LEN(YEAR) = 4)
    CONSTRAINT CHECK_SUBJOFFERING_SEM CHECK(SEMESTER INT (1,2))
    CONSTRAINT CHECK_SUBJOFFERING_FEE CHECK(FEE > 0)
 )

 Create Table Enrolment(
    StudentID, NVARCHAR(10)
    SubjCode, NVARCHAR(100)
    Year, INT
    Semester, INT  
    DateEnrolled, DATE
    Grade NVARCHAR(2) DEFAULT NULL
    PK(StudentID, SubjCode, Year, Semester)
    FK(StudentID) References Student
    FK(SubjCode, Year, Semester) References SubjectOffering
    CONSTRAINT CHECK_ENROLMENT_YEAR CHECK(LEN(YEAR) = 4)
    CONSTRAINT CHECK_ENROLMENT_SEM CHECK(SEMESTER INT (1,2))
    CONSTRAINT CHECK_ENROLMENT_GRADE CHECK(GRADE INT("‘N’, ‘P’, ‘C’, ‘D’, ‘HD’"))
 )
 