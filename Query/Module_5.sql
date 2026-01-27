SHOW Databases;
use company_db;

SHOW TABLES

-- Total Employee Count
SELECT COUNT(*) FROM employees;

-- Maximum salary
SELECT MAX(salary) FROM employees;

SELECT dept_id, COUNT(*) AS emp_count
FROM employees
GROUP BY dept_id;

SELECT * FROM employees;

SELECT COUNT(student_id) FROM courses; -- not consider null values

-- AVG Salary by dept
SELECT dept_id, AVG(salary)
FROM employees
GROUP BY dept_id;


-- SUM of salary by department
SELECT dept_id, SUM(salary)
FROM employees
GROUP BY dept_id;

-- Department with Highest Total Salary
SELECT dept_id, SUM(salary) AS total_sal
FROM employees
group by dept_id
order by total_sal DESC
limit 1
OFFSET 1
