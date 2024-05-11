
-- Create Employees table
CREATE TABLE Emps (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATETIME    -- CAST(BirthDate AS DATE) converts the BirthDate column from -> datetime to date.
);


-- insert data
insert into Emps (EmployeeID,FirstName,LastName ,BirthDate) Values (1,'Pramod','Thete','08-10-1999');



-- Select query using CAST and GETDATE functions
SELECT 
    EmployeeID, 
    FirstName, 
    LastName, 
    CAST(BirthDate AS DATE) AS DateOfBirth,
    GETDATE() AS CurrentDate
FROM 
    Emps;
