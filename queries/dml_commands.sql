
-- DML COMMANDS

--select * from employee;

-- insert data
insert into employee(Id,EmpName,City,Salary)
values (1,'Vaibhav','Junnar',7000),(2,'Pranav','Amravati',8000),(3,'Hrituj','Wardha',8500),(4,'Pramod','Junnar',9000),(5,'Nitesh','Patna',10000);



-- update one record according to condition
update employee 
set City = 'CDE' 
where Id=2;

-- multiple rows update by id using case and when
update employee
set City =
	case id
		when 3 then 'Amravati'
		when 4 then 'Patna'
		when 5 then 'Wardha'

		else City
	end
where Id in (3,4,5);



-- delete all the records from table
delete from employee;

-- delete one record
DELETE FROM employee WHERE EmpName='Pramod';