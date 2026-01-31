USE sql_concepts;

-- WITHOUT USING WINDOW FUNCTION
-- You will only get the one column
SELECT emp_role,COUNT(*)
FROM employee_data
GROUP BY emp_role;

-- WITH USING WINDOW FUNCTION
SELECT emp_role, COUNT(*) OVER () AS Emp_Count
FROM employee_data

SELECT emp_role, COUNT(*) OVER (PARTITION BY emp_role) AS Emp_Count
FROM employee_data


-- Gives a unique number to each row

SELECT
    ROW_NUMBER() OVER (ORDER BY emp_name) AS rn,
    emp_name,
    emp_role
FROM employee_data;