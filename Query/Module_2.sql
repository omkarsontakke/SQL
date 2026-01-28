SHOW DATABASES;

USE db_company;

CREATE TABLE employee_details(
    emp_id int,
    name VARCHAR(255),
    email VARCHAR(255),
    salary DECIMAL(10,2),
    joining_date DATE
);

SELECT * from employee_details;

-- Add Column in the existing table
ALTER TABLE employee_details ADD department varchar(255);

-- Modify existing coloumn
ALTER TABLE employee_details MODIFY salary DECIMAL(12,2);

-- Describe the table
DESC employee_details;

-- Drop the column from existing table
ALTER TABLE employee_details DROP department;

-- DELETE the employee whos id is 2
DELETE FROM employee_details WHERE emp_id=999;

SELECT * FROM employee_details;

INSERT INTO employee_details (emp_id, name, email, salary, joining_date)
    VALUES (1,"Omkar","om@gmail.com",79000,"2024-11-2"),
        (2,"Shraddha","shra@gmail.com",9000,"2022-07-02") ;


-- UPDATE DATA
UPDATE employee_details SET emp_id=2 WHERE email='om@gmail.com';
UPDATE employee_details SET email=null WHERE emp_id=9;

-- DELETE ROW
DELETE FROM employee_details WHERE emp_id=2;

-- SELECT Specific columns
SELECT emp_id,salary from employee_details;

-- Get filter data based on the condition
SELECT * from employee_details WHERE salary < 1000;

-- AND/OR Operator
SELECT * FROM employee_details WHERE salary > 100 AND joining_date > '2022-08-02';

-- Get Customer in DESCENDING ORDER
SELECT * FROM employee_details ORDER BY emp_id DESC;

-- Limit Concept (Pagination)
SELECT * FROM employee_details ORDER BY salary ASC LIMIT 5;

-- LIKE (Filtering Patterns)
SELECT * FROM employee_details WHERE name LIKE 'S%'

-- IN
SELECT * FROM employee_details WHERE emp_id IN (2,4,1);

-- BETWEEN
SELECT * FROM employee_details WHERE salary BETWEEN 40000 AND 80000

-- null value extracting
SELECT * FROM employee_details WHERE email IS null;

-- Employees joined after 2023, Salary > 50K, Sorted by salary
SELECT emp_id,name,salary FROM employee_details WHERE salary > 50000 AND joining_date > '2023-01-01' ORDER BY salary;

-- Top 3 Highest Salaries
select salary FROM employee_details ORDER BY salary DESC LIMIT 3

-- Find the SECOND-HIGHEST SALARY of EMP
SELECT DISTINCT salary from employee_details ORDER BY salary DESC LIMIT 1 OFFSET 1;

-- Change Column Name
SELECT * FROM employee_details;
ALTER TABLE employee_details
CHANGE COLUMN name emp_name varchar(255);

-- MODIFY TABLE
ALTER TABLE employee_details
MODIFY email CHAR(200);

-- ADD COLUMN
ALTER TABLE employee_details
ADD COLUMN emp_vendor_name varchar(20) NOT NULL DEFAULT ("ICICI BANK");

SELECT * from employee_details;