

-- this is not allowed because of aggregate function we cannot show normal column (only can show Computed columns)
/*
SELECT EmpName,AVG(Salary) AS AvgSalary
FROM tblEmployee;
*/

-- thats why we use sub-queries

-- Sub-Queries

-- Non Correlated SubQuery
SELECT EmpName, (SELECT AVG(Salary) FROM tblEmployee) AS AvgSalary
FROM tblEmployee;

SELECT EmpName, Gender, Salary 
FROM tblEmployee
-- WHERE Salary < AVG(Salary);
WHERE Salary < (SELECT AVG(Salary) FROM tblEmployee);


-- Correlated SubQuery

-- with inner join
SELECT t1.EmpName, t2.DeptName
FROM tblEmployee t1
JOIN (SELECT * FROM tblDepartment) t2 
ON t1.DeptID = t2.DeptID;

-- find greater than average salary
SELECT EmpName, Salary
FROM tblEmployee t1
WHERE Salary > (SELECT AVG(Salary) FROM tblEmployee t2 WHERE t2.DeptID = t1.DeptID);

-- using exists
SELECT EmpName, Salary
FROM tblEmployee t1
WHERE EXISTS (SELECT 1 FROM tblDepartment t2 WHERE t1.DeptID = t2.DeptID);

SELECT EmpName
FROM tblEmployee e
WHERE EXISTS (
    SELECT 1
    FROM tblEmployee
    WHERE Salary = 4000
    AND EmpID = e.EmpID -- correlation to the outer query
);
/*
The purpose of SELECT 1 is to check for the existence of at least one row 
that satisfies the condition in the subquery. 
Using SELECT 1 is efficient because it only needs to determine whether at least one row exists; 
it doesn't need to retrieve any actual data.
*/


-- Non Correlated SubQuery
select EmpName 
from tblEmployee
where DeptId in (select DeptId from tblDepartment where DeptId>1);









