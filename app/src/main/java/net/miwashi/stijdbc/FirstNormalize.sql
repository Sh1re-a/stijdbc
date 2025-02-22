
DROP TABLE IF EXISTS UNF;
CREATE TABLE `UNF` (
`Id` DECIMAL(38, 0) NOT NULL,
`Name` VARCHAR(26) NOT NULL,
`Grade` VARCHAR(11) NOT NULL,
`Hobbies` VARCHAR(25),
`City` VARCHAR(10) NOT NULL,
`School` VARCHAR(20) NOT NULL,
`HomePhone` VARCHAR(12),
`JobPhone` VARCHAR(12),
`MobilePhone1` VARCHAR(12),
`MobilePhone2` VARCHAR(12)
);

LOAD DATA INFILE '/var/lib/mysql-files/denormalized-data.csv'
INTO TABLE UNF 
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



