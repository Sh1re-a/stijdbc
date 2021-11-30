
DROP TABLE IF EXISTS School;
CREATE TABLE School AS SELECT DISTINCT 0 As Id, School As Name, City FROM UNF;
SET @incrementValue = 0;
UPDATE School set Id =  (select @incrementValue := @incrementValue + 1);
ALTER TABLE School ADD PRIMARY KEY(Id);
ALTER TABLE School MODIFY Id INTEGER NOT NULL AUTO_INCREMENT;
DROP TABLE IF EXISTS Student_School;
CREATE TABLE Student_School AS
SELECT DISTINCT UNF.Id AS StudentId, School.Id AS SchoolId FROM UNF INNER JOIN School ON UNF.School = School.Name;

DROP TABLE IF EXISTS FinalStudent_School;
CREATE TABLE FinalStudent_School AS
SELECT Student.Id AS Id, Student.Name AS Name, School.Name AS School, City 
FROM Student 
INNER JOIN Student_School 
ON Student.Id = Student_School.StudentId 
INNER JOIN School 
ON Student_School.SchoolId = School.Id;







 


