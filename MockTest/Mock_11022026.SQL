SHOW DATABASES;

USE sql_concepts;

SHOW TABLES;

SELECT * FROM employee_data;

-- Count Employees in Each City
SELECT emp_city, count(*) AS EMP_CITY_COUNT
FROM employee_data
GROUP BY emp_city ;

-- Find Employees From Mumbai With Salary Between 50k and 1 Lakh
SELECT emp_name,emp_city
FROM employee_data
WHERE emp_salary BETWEEN 50000 AND 100000 AND emp_city="Mumbai";

UPDATE employee_data SET joining_date="2002-03-07" WHERE emp_id=2;


-- Find Employees Born before 2000

SELECT emp_name, emp_role, joining_date
FROM employee_data
HAVING joining_date < "2000-01-01"

-- FIND THE SECOND_HIGHEST SALARY

SELECT DISTINCT emp_salary
FROM employee_data
ORDER BY emp_salary DESC
LIMIT 1
OFFSET 1;

-- Find Duplicate role Names
SELECT emp_role, COUNT(*) as role_count
FROM employee_data
GROUP BY emp_role
HAVING role_count > 1;