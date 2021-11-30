DROP TABLE IF EXISTS Student_Phone;
Create Table Student_Phone AS
SELECT Name, "Job" as PhoneType, JobPhone as PhoneNumber FROM UNF
UNION SELECT Name, "HOME", HomePhone FROM UNF
UNION SELECT Name, "MobilePhone1", MobilePhone1 FROM UNF
UNION SELECT Name, "MobilePhone2", MobilePhone2 FROM UNF;