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




--top
select top 3 * from employee 
order by Salary desc;

SELECT TOP 10 PERCENT EmpName, Salary
FROM employee
ORDER BY Salary DESC;

-- find 3 rd maximum salary
select top 1 * from
(select top 3 Salary from employee order by Salary desc) 
as employee order by Salary;

SELECT * FROM employee order by Salary;

SELECT * FROM employee WHERE City IS NOT NULL;


-- Using LIKE
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


-- find 3rd max salary two way
-- 1)Using TOP with subquery
select top 1 * from
(select top 3 Salary from employee order by Salary desc) 
as employee order by Salary;

--2) using 'ROW_NUMBER() OVER'
SELECT Salary
FROM (
    SELECT Salary, ROW_NUMBER() OVER (ORDER BY Salary DESC) AS row_num
    FROM tblEmployee
) AS ranked_salaries
WHERE row_num = 3;


ALTER TABLE tblEmployee
ALTER column mysal int; -- change data type