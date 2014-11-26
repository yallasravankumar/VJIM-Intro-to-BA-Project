# Querying all data in a table
select * from studentdata;
select * from parentdetails;
select * from studenteducationdata;
select * from entranceresults;


# Querying the structure of the table
describe studentdata;
describe parentdetails;
describe studenteducationdata;
describe entranceresults;

#gpa greater than 3.6

select 	rollnumber,firstname,gpa
from 	studentdata
where 	gpa < 3.6;

#complete details of entrance
select	*
from	studentdata,entranceresults
where	studentdata.rollnumber = entranceresults.rollnumber;

# Simple Joinsapply
# What colleges and majors did each of the student apply to?
select firstname,entrancetest,entrancepercentile
from studentdata,entranceresults
where studentdata.rollnumber = entranceresults.rollnumber;

# Using aliases for tables
select firstname,fathername,location
from studentdata s, parentdetails p
where s.rollnumber = p.rollnumber;

select firstname, specialization,attendance
from studentdata s,studenteducationdata se
where s.rollnumber =  se.rollnumber;

# Distinct values
select   distinct firstname, specialization
from studentdata s,studenteducationdata se
where s.rollnumber = se.rollnumber;

#students names starting with c
select rollnumber,firstname,gpa
from studentdata
where firstname like "C%";
select firstname,entrancescore from studentdata,entranceresults where entrancescore >=500;

#specialization 
Select rollnumber, firstname
from 	studentdata
where 	rollnumber in 
( select rollnumber from  studenteducationdata where specialization = "HR");

#students with 5 gpa
Select  gpa ,firstname,rollnumber
from  studentdata where gpa=5 and rollnumber in (select rollnumber from studenteducationdata where specialization like "F%");


select 	firstname, gpa
from	studentdata
where	 gpa  >= ALL (select	gpa
					from	studentdata);

#To find students number in various specializations
select count(specialization) from studenteducationdata where specialization like "M%" AND graduation ="B.Tech";
select count(specialization) from studenteducationdata where specialization like "A%" and graduation="B.Com";
select count(specialization) from studenteducationdata where specialization like "O%";
select count(specialization) from studenteducationdata where specialization like "H%";
select count(specialization) from studenteducationdata where specialization like "F%";
select count(gpa) from studentdata where gpa>4;

#students with 100% attendence
select attendance ,firstname, gpa from studentdata where attendance = 100 and gpa <5;

#students with b.com,marketing
select 	rollnumber, firstname
from	studentdata
where	rollnumber in (select rollnumber
				from	studenteducationdata
				where	graduation = "B.Com") 
AND
		rollnumber not in (select	rollnumber
				from	studenteducationdata
					where 	specialization = 'MARKETING');

#students from telegana
select	count(rollnumber),location
from	parentdetails p1
where	exists (select	*
				from	parentdetails p2
				where	p1.location='TELANGANA');
#students from rest of telegana
select	studentdata.rollnumber,firstname,location
from	parentdetails p1,studentdata
where	NOT exists (select	*
				from	parentdetails p2
				where	p1.location='TELANGANA');

