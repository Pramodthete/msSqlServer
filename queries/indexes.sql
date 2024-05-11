
-- Indexing

-- Create a filtered index
CREATE INDEX idx_Salary_Filtered 
ON tblEmployee(Salary) 
WHERE Salary > 2000;
  
-- Create a non-clustered index on multiple columns
CREATE INDEX idx_empname ON tblEmployee(EmpName,Salary);

-- Create a unique index (EmpId is unique)
CREATE UNIQUE INDEX idx_EmpId ON tblEmployee(EmpId);


-- View all indexes on a table
SELECT 
    OBJECT_NAME(object_id) AS TableName,
    name AS IndexName,
    type_desc AS IndexType,
    is_unique AS IsUnique,
    is_primary_key AS IsPrimaryKey
FROM sys.indexes 
WHERE OBJECT_NAME(object_id) = 'tblEmployee';


-- Drop an index
DROP INDEX idx_Email ON tblEmployee;


-- Disable an index, prevent queries from using an index
ALTER INDEX idx_empname ON tblEmployee DISABLE;

-- Enable an index
ALTER INDEX idx_empname ON tblEmployee REBUILD;

-- Reorganize an index
-- maintenance operation that defragments the index pages and compacts the index
ALTER INDEX idx_empname ON tblEmployee REORGANIZE;
