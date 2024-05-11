-- Employee table with various constraints
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY, -- primary key constraint
    FirstName VARCHAR(50) NOT NULL, -- NOT NULL constraint
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,  -- UNIQUE constraint
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),  -- CHECK constraint
    BirthDate DATE,
    DepartmentID INT DEFAULT 1, -- DEFAULT constraint
    CONSTRAINT FK_DepartmentID FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),  -- FOREIGN KEY constraint with REFERENCES 
	INDEX emp_index(EmployeeID,Email)   -- INDEX constraint
);


-- Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (1, 'IT');
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (2, 'HR');

-- Insert
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Gender, BirthDate, DepartmentID) 
VALUES (1, 'John', 'Doe', 'john.doe@example.com', 'M', '1990-01-01', 1);

-- Try to insert a duplicate EmployeeID
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Gender, BirthDate, DepartmentID) 
VALUES (1, 'Jane', 'Smith', 'jane.smith@example.com', 'F', '1991-01-01', 2);

-- duplicate Email
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Gender, BirthDate, DepartmentID) 
VALUES (2, 'Jane', 'Smith', 'john.doe@example.com', 'F', '1991-01-01', 2);

-- invalid Gender
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Gender, BirthDate, DepartmentID) 
VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com', 'X', '1991-01-01', 2);

SELECT * FROM Employees;
SELECT * FROM Departments;

DROP TABLE Employees;
DROP TABLE Departments;
