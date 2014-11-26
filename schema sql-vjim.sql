
drop schema vjim;
create schema vjim;

drop table if exists studentdata;
CREATE TABLE studentdata (
  rollnumber int NOT NULL,
  firstname VARCHAR(255) NOT NULL,lastname VARCHAR(255) NOT NULL,
  dateofbirth date  ,gender CHAR(255) NOT NULL,
 gpa Int,attendance int,
  PRIMARY KEY (rollnumber)
);

load data local infile 'C:/Users/3XP/Desktop/SQL 2/studentdata.csv' into table studentdata fields terminated by ','
enclosed by '"'
lines terminated by '\n' IGNORE 1 Rows
(rollnumber,firstname,lastname,dateofbirth,gender,gpa,attendance) ;

Select * from studentdata;

DROP TABLE IF EXISTS `vjim`.`parentdetails` ;

CREATE TABLE IF NOT EXISTS `vjim`.`parentdetails` (
  `fathername` VARCHAR(45) NULL,
  `mobilenumber` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,`rollnumber` INT NOT NULL);


load data local infile 'C:/Users/3XP/Desktop/SQL 2/parentdetails.csv' into table parentdetails fields terminated by ','
enclosed by '"'
lines terminated by '\n' IGNORE 1 Rows
(fathername,mobilenumber,address,location,rollnumber)
 ;
select * from parentdetails;

DROP TABLE IF EXISTS `vjim`.`studenteducationdata` ;

CREATE TABLE IF NOT EXISTS `vjim`.`studenteducationdata` (
  `sscmarks` VARCHAR(45) NULL,
  `intermarks` VARCHAR(45) NULL,
  `workeperience` DECIMAL(10,0) NULL,
  `rollnumber` INT NOT NULL,
  `graduation` VARCHAR(45) NULL,
  `graduationpercentage` VARCHAR(45) NULL,
  `specialization` VARCHAR(45) NULL,`specialization2` VARCHAR(45) NULL,
  PRIMARY KEY (`rollnumber`));


load data local infile 'C:/Users/3XP/Desktop/SQL 2/studenteducationdata.csv' into table studenteducationdata fields terminated by ','
enclosed by '"'
lines terminated by '\n' IGNORE 1 Rows
(sscmarks,intermarks,
  workeperience,rollnumber,graduation,graduationpercentage,specialization,specialization2)
 ;

select * from studenteducationdata;

DROP TABLE IF EXISTS `vjim`.`entranceresults` ;

CREATE TABLE IF NOT EXISTS `vjim`.`entranceresults` (
  `entrancetest` TEXT NULL,
  `entrancescore` VARCHAR(45) NULL,
  `entrancepercentile` VARCHAR(45) NULL,
  `rollnumber` INT NOT NULL,PRIMARY KEY (`rollnumber`));

load data local infile 'C:/Users/3XP/Desktop/SQL 2/entrance results.csv' into table entranceresults fields terminated by ','
enclosed by '"'
lines terminated by '\n' IGNORE 1 Rows
(entrancetest,
entrancescore,
entrancepercentile,
  rollnumber)
 ;
