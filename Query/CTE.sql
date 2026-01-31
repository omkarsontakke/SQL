SHOW DATABASES;

use sql_concepts;

SHOW TABLES;

SELECT * FROM employee_data;
/*
Problem Statement
    Find the Employee details that salary is greater than their average department salary
    Soln:- Here is 2 task that depend on another
        1. First you have to find average salary by dept,
        2. Then use that result to find the empty salary that is greater than their avg dept salary.
 */

WITH emp_sal_greaterthan_avgdeptsal AS (
     SELECT emp_role, AVG(emp_salary) AS avg_sal FROM employee_data GROUP BY emp_role
)

SELECT e.emp_name, e.emp_role, e.emp_salary, res.avg_sal
FROM employee_data AS e
JOIN emp_sal_greaterthan_avgdeptsal as res
ON  e.emp_role = res.emp_role
WHERE e.emp_salary > res.avg_sal;

/*
 Problem Statement 2:

    Find the Highest Paid Salary in each department
    Task 1 : Group the employees by department
    Task 2 : Find the Highest Salary amount the department
 */

WITH highest_paid_emp_ineach_dept AS (
    SELECT emp_role, MAX(emp_salary) AS max_salary FROM employee_data GROUP BY emp_role
)
SELECT  e.emp_name, e.emp_role, e.emp_salary, res.max_salary
FROM employee_data AS e
JOIN highest_paid_emp_ineach_dept AS res
ON e.emp_role = res.emp_role
WHERE e.emp_salary = res.max_salary;


/*
    Problem Statement 3:
        Get departments with more than 1 employees
    Task 1: Group the dept
    Task 2: find group that greater than 1 employee
 */

WITH emp_greaterthan_one_in_dept AS (
     SELECT emp_role,  COUNT(*)  AS emp_count
     FROM employee_data
     GROUP BY emp_role
)
SELECT emp_role
FROM emp_greaterthan_one_in_dept
WHERE emp_count > 1;


WITH emp_greaterthan_one_in_dept AS (
    SELECT emp_role , COUNT(*) AS emp_count
    FROM employee_data GROUP BY emp_role
)
SELECT e.emp_name, e.emp_role, e.emp_manager_name, g.emp_count
FROM employee_data AS e
JOIN emp_greaterthan_one_in_dept AS g
ON e.emp_role=g.emp_role
WHERE g.emp_count > 1;