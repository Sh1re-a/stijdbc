DROP VIEW IF EXISTS HobbyUNF;
CREATE VIEW HobbyUNF AS 
SELECT Id, "We want first from all!" AS Cause, Hobbies,
Trim(SUBSTRING_INDEX(Hobbies, ",", 1)) FROM UNF
UNION
SELECT Id, "We want middle when three!", Hobbies,
Trim(SUBSTRING_INDEX(SUBSTRING_INDEX(Hobbies, ",", -2),"," ,1)) FROM UNF
WHERE (LENGTH(Hobbies) - LENGTH(REPLACE(Hobbies, ',', ''))=2)
UNION
SELECT Id, "We want last when more than one!", Hobbies,
Trim(SUBSTRING_INDEX(Hobbies, ",", -1)) FROM UNF
WHERE (LENGTH(Hobbies) - LENGTH(REPLACE(Hobbies, ',', ''))>=1);

DROP TABLE IF EXISTS Hobby;
CREATE TABLE Hobby AS
SELECT DISTINCT 0 AS Id, Hobbies AS Name FROM HobbyUNF WHERE Hobbies <> "";
DELETE FROM Hobby WHERE Name = "Nothing";
SET @incrementValue = 0;
UPDATE Hobby set Id =  (select @incrementValue := @incrementValue + 1);
ALTER TABLE Hobby ADD PRIMARY KEY(Id);
ALTER TABLE Hobby MODIFY Id INTEGER NOT NULL AUTO_INCREMENT;
DROP TABLE IF EXISTS Student_Hobby;
CREATE TABLE Student_Hobby AS
SELECT DISTINCT HobbyUNF.Id AS StudentId, Hobby.Id AS HobbyId
FROM HobbyUNF INNER JOIN Hobby
ON HobbyUNF.Hobbies = Hobby.Name;
DROP TABLE IF EXISTS FinalStudent_Hobby;
Create table FinalStudent_Hobby AS
SELECT Student.Name, Group_concat(Hobby.Name) As Hobbies
FROM Student
INNER JOIN Student_Hobby
ON Student.Id = Student_Hobby.StudentId
INNER JOIN Hobby
ON Student_Hobby.HobbyId = Hobby.Id
GROUP BY Student.Name;