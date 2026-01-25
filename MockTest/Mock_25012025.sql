SHOW databases;

USE db_company;

show tables;

select * from employee_details;

-- Find the Second-Highest Salary of the employee
SELECT name,salary FROM employee_details
ORDER BY salary DESC
LIMIT 1
OFFSET 1;

select * from employee_details;

-- Write a query to find all employees from HR department
SELECT e.name, d.dept_name
FROM employee_details e
INNER JOIN department d
ON e.emp_id=d.dept_id
WHERE d.dept_name="IT";


-- Find duplicate records from the table
SELECT email, COUNT(*) as count
from employee_details
group by email
having count> 1;


EXPLAIN ANALYZE
SELECT *
FROM employee_details
WHERE emp_id = 1;

