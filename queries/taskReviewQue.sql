

	-- task from mentor

use pramoddb;

-- branch name, branch code

-- student name, branch code , phone no.


CREATE TABLE branch(
	branch_name varchar(40),
	branch_code int
);

insert into branch (branch_name, branch_code) values ('Civil',1234),('IT',2345),('Electronics',3456),('Mechanical',4567);


CREATE TABLE student(
	student_name varchar(40),
	branch_code int,
	phone_no varchar(20)
);



INSERT INTO student (student_name, branch_code, phone_no) 
VALUES 
('Pramod', (SELECT branch_code
            FROM branch
            WHERE branch_name = 'Civil'), '9999999999'),

('Suraj', (SELECT branch_code
            FROM branch
            WHERE branch_name = 'IT'), '8888888888'),

('Vaibhav', (SELECT branch_code
            FROM branch
            WHERE branch_name = 'Electronics'), '7777777777'),

('Siddhesh', (SELECT branch_code
            FROM branch
            WHERE branch_name = 'Mechanical'), '8787878787');


select * from student;