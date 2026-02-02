SHOW DATABASES;

USE sql_concepts;

SELECT * FROM employee_data LIMIT 5;

-- FIND THE SECOND-HIGHEST SALARY FROM THE TABLE
SELECT emp_name, emp_salary , emp_role
FROM employee_data ORDER BY emp_salary DESC
LIMIT 1
OFFSET 1;

-- FIND SECOND_HIGHEST SALARY USING THE SUB-QUERY
SELECT emp_name, emp_role, emp_salary
FROM employee_data
WHERE emp_salary = (
        SELECT DISTINCT emp_salary
        FROM employee_data
        ORDER BY emp_salary DESC
        LIMIT 1
        OFFSET 1
    );

-- FIND THE NUMBER OF EMPLOYEES IN EACH DEPARTMENT
SELECT emp_role , COUNT(*) AS emp_by_dept_count
FROM employee_data
GROUP BY emp_role ;

-- Find departments having more than 3 employees
SELECT emp_role, COUNT(*) AS emp_count
FROM employee_data GROUP BY emp_role
HAVING emp_count > 1;

SELECT emp_name, emp_role, emp_manager_name
FROM employee_data
WHERE emp_role IN (SELECT emp_role
    FROM employee_data GROUP BY emp_role
    HAVING COUNT(*) > 1)

