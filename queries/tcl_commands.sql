
-- TCL Commands

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