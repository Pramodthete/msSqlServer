
create database pramoddb;

use pramoddb;

create table employee (
Id int primary key,
EmpName varchar(255),
City varchar(255),
Salary int
);

select * from employee;

insert into employee(Id,EmpName,City,Salary)
values (1,'Vaibhav','Junnar',7000),(2,'Pranav','Amravati',8000),(3,'Hrituj','Wardha',8500),(4,'Pramod','Junnar',9000),(5,'Nitesh','Patna',10000);


-- distinct
select distinct Salary from employee;

select count(distinct Salary) as SalaryCountDistinct from employee;

select count(*) as countSal from (select distinct * from employee) as emp;



-- order by
select Salary,EmpName, Id, City from employee order by Salary desc;

select * from employee order by City desc, Salary desc;


-- where
select * from employee where not Salary= 10000;

select * from employee where Salary not in (7000,10000);

select * from employee where Salary not between 8000 and 10000;

select * from employee where EmpName between 'Nitesh' and 'Tom'
order by EmpName;

select Id,EmpName from employee where Salary < 9000;

select * from employee where EmpName like 'H%' or EmpName like 'P%';



-- EXEC is a command to execute Procedure (renaming column)
 EXEC sp_rename 'employee.City', 'Cities', 'COLUMN';

/* ALTER TABLE employee
RENAME COLUMN City TO Cities;
*/

ALTER TABLE employee
ADD City VARCHAR(40);

-- drop column with alter
alter table employee
drop column Cities;

-- update one record
update employee 
set City = 'CDE' 
where Id=2;

-- for renaming table
EXEC sp_rename 'emp', 'employee';


-- multiple rows update by id
update employee
set City =
	case id
		when 3 then 'Amravati'
		when 4 then 'Patna'
		when 5 then 'Wardha'

		else City
	end
where Id in (3,4,5);


-- drop
drop table employee;

-- truncate
truncate table employee;



-- Start a transaction
BEGIN TRANSACTION;

-- Inserting data into the employee table
INSERT INTO employee (Id, EmpName, City,Salary)
VALUES (9, 'Suraj', 'Solapur',7500);

-- Savepoint declaration
SAVE TRANSACTION SavePoint1;

-- Inserting more data into the employee table
INSERT INTO employee (Id, EmpName, City,Salary)
VALUES (7, 'Alice', 'Los Angeles',7800);

-- Check if data is inserted correctly
SELECT * FROM employee;

-- Rollback to the savepoint
ROLLBACK TRANSACTION SavePoint1;

-- Check if the data is rolled back
SELECT * FROM employee;

-- Inserting data again
INSERT INTO employee (Id, EmpName, City,Salary)
VALUES (7, 'Alice', 'Los Angeles',7800);

-- Commit the transaction
COMMIT TRANSACTION;

-- now we cannot rollback transaction, because transaction already commited

-- Check the final data in the employee table
SELECT * FROM employee;


select count(Salary) as countSal from employee group by Salary;


SELECT * FROM employee WHERE City IS NOT NULL;

delete from employee;



DELETE FROM employee WHERE EmpName='Pramod';


--top
select top 3 * from employee 
order by Salary desc;

SELECT TOP 10 PERCENT EmpName, Salary
FROM employee
ORDER BY Salary DESC;

select top 1 * from
(select top 3 Salary from employee order by Salary desc) 
as employee order by Salary;

SELECT * FROM employee order by Salary;


-- 'SELECT * FROM employee FETCH FIRST 3 ROWS ONLY;' its for mysql   -> this is not working in sql server


SELECT * FROM employee
WHERE Salary > (SELECT AVG(Salary) FROM employee);



/*
%	Represents zero or more characters
_	Represents a single character
[]	Represents any single character within the brackets *
^	Represents any character not in the brackets *
-	Represents any single character within the specified range *
{}	Represents any escaped character **
*/

SELECT * FROM employee
WHERE City LIKE 'Am__vati';

SELECT * FROM employee
WHERE EmpName LIKE '[a-h]%';

SELECT * FROM employee
WHERE EmpName LIKE '[ph]%';

