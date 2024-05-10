
-- aggregate functions

-- count()

select COUNT(distinct Salary) as SalaryCountDistinct from employee;

select COUNT(*) as countSal from (select distinct * from employee) as emp;

select COUNT(Salary) as countSal from employee group by Salary;


-- average AVG()
SELECT * FROM employee
WHERE Salary > (SELECT AVG(Salary) FROM employee);


--  SUM()
SELECT SUM(Salary) as Sal FROM tblEmployee;

SELECT Gender, sum(Salary) as Sal from tblEmployee
GROUP BY Gender
HAVING SUM(Salary)>13300;


-- MIN()
SELECT MIN(EmpName) AS EmpName, Gender, SUM(Salary) AS [Sum Of Salary]
FROM tblEmployee
GROUP BY Gender

select * from tblEmployee;


-- MAX()
SELECT MAX(Salary) as Sal FROM tblEmployee;

-- second maximum salary by subqueries
SELECT MAX(Salary) as SecondMaxSal 
FROM tblEmployee 
WHERE Salary < (SELECT MAX(Salary) FROM tblEmployee);



