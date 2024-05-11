
-- local temporary table

CREATE TABLE #localTable(
	tableId int,
	tName varchar(40),
	tdate date
);

INSERT INTO #localTable (tableId,tName,tdate)
VALUES (4,'local4','08-18-2023'),
(5,'local5','01-15-2023'),
(6,'local6','07-30-2023');

SELECT * FROM #localTable;

-- Drop the local temporary table
DROP TABLE #localTable;



-- global temporary table
CREATE TABLE ##GlobalTable (
    ID INT,
    Name VARCHAR(50)
);


INSERT INTO ##GlobalTable (ID, Name) VALUES (1, 'John');
INSERT INTO ##GlobalTable (ID, Name) VALUES (2, 'Jane');


SELECT * FROM ##GlobalTable;

-- Drop the global temporary table
DROP TABLE ##GlobalTable;


