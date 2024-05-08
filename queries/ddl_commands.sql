
-- DDL COMMANDS

create database pramoddb;

use pramoddb;

-- 1) create
create table employee (
Id int primary key not null,
EmpName varchar(50),
City varchar(40),
Salary int
);

-- this is DQL command to show data from table
select * from employee;


-- 2) drop
drop table employee;

drop database pramoddb;


-- 3) truncate
truncate table employee;


-- 4) alter (add column)
ALTER TABLE employee
ADD Email int;

-- drop column with alter
alter table employee
drop column Email;

/* In MySQL
ALTER TABLE employee
MODIFY COLUMN Email varchar;
*/
-- In SQL SERVER to change column datatype
ALTER TABLE employee
ALTER COLUMN Email VARCHAR(255);



-- 5) rename
-- for renaming table
EXEC sp_rename 'emp', 'employee';

-- EXEC is a command to execute Procedure (renaming column)
-- sp_rename is a procedure
 EXEC sp_rename 'employee.City', 'Cities', 'COLUMN';

 -- not working in sql server
 /* ALTER TABLE employee
RENAME COLUMN City TO Cities;
*/
