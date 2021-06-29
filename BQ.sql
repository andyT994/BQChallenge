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
