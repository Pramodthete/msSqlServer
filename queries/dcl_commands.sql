-- DCL Commands

-- GRANT command
GRANT SELECT ON employee TO 'demo'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE ON employee TO 'demo'@'localhost';

GRANT ALL ON employee TO 'demo'@'localhost';

GRANT SELECT ON employee TO '*'@'localhost';

-- GRANT EXECUTE ON PROCEDURE dbmsProcedure TO 'demo'@'localhost';


-- REVOKE command
REVOKE SELECT ON employee FROM 'demo'@'localhost';

REVOKE SELECT, INSERT, DELETE, UPDATE ON Users FROM 'demo'@'localhost'; 

-- REVOKE EXECUTE ON FUNCTION Calculatesalary FROM 'demo'@'localhost'; 

