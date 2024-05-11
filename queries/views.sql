
use pramoddb;


-- View


CREATE VIEW emp_view AS
SELECT EmpId, EmpName, Salary
FROM tblEmployee
WHERE DeptId=1;


-- Insert a record into the view
INSERT INTO emp_view (EmpId, EmpName, Salary)
VALUES (123, 'John', 10000);


SELECT * FROM emp_view;


DELETE FROM emp_view
WHERE EmpId = 123;


-- Modify the view to add a new column
ALTER VIEW emp_view AS
SELECT EmpId, EmpName, Salary, Gender
FROM tblEmployee;


