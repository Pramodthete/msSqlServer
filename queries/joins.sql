
-- Joins

use pramoddb;
CREATE TABLE tblDepartment (
    DeptID INT PRIMARY KEY NOT NULL,
    DeptName VARCHAR(40),
    DeptLocation VARCHAR(100),
    DeptHead VARCHAR(40)
);

CREATE TABLE tblEmployee (
    EmpID INT PRIMARY KEY NOT NULL,
    EmpName VARCHAR(255),
    Gender VARCHAR(255),
    Salary INT,
    DeptId INT,
    FOREIGN KEY (DeptId) REFERENCES tblDepartment(DeptID)
);

insert into tblDepartment (DeptID,DeptName,DeptLocation,DeptHead)
values (1,'IT','London','Rick'), 
(2,'Payroll','Delhi','Ron'),
(3,'HR','New York','Christie'),
(4,'Other Department','Sydney','Cindrella');

select * from tblDepartment;

insert into tblEmployee (EmpID,EmpName,Gender,Salary,DeptId)
values (1,'Tom','Male',4000,1),
(2,'Pam','Female',3000,3),
(3,'John','Male',3500,1),
(4,'Sam','Male',4500,2),
(5,'Todd','Male',2800,2),
(6,'Ben','Male',7000,1),
(7,'Sara','Female',4800,3),
(8,'Valarie','Female',5500,1),
(9,'James','Male',6500,null),
(10,'Russell','Male',8800,null);

select * from tblEmployee;



-- inner join or Join
select EmpName,Gender, Salary, DeptName, DeptHead
from tblEmployee
inner join tblDepartment
ON tblEmployee.DeptId = tblDepartment.DeptID;


-- left join or left outer join
select EmpName, Gender, Salary, DeptName, DeptHead
from tblEmployee
left outer join tblDepartment
ON tblEmployee.DeptId = tblDepartment.DeptID;


-- right join or right outer join
select EmpName, Gender, Salary, DeptName, DeptHead
from tblEmployee
right join tblDepartment
ON tblEmployee.DeptId = tblDepartment.DeptID;


-- full join or full outer join
select EmpName, Gender,Salary, DeptName, DeptHead
from tblEmployee
full outer join tblDepartment
ON tblEmployee.DeptId = tblDepartment.DeptID
where Salary>=4000 and DeptName='IT';


-- self join
SELECT *
FROM tblEmployee tblEmployee1
JOIN tblEmployee tblEmployee2 
ON tblEmployee1.EmpID < tblEmployee2.DeptId;

SELECT A.EmpName AS Emp1, B.EmpName AS Emp2, A.Gender
FROM tblEmployee A, tblEmployee B
WHERE A.EmpID != B.EmpID   -- WHERE A.EmpID <> B.EmpID
AND A.Gender = B.Gender 
ORDER BY A.Gender;


-- cross join
SELECT *
FROM tblEmployee
CROSS JOIN tblDepartment;
