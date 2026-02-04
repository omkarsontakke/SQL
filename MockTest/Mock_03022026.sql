SHOW DATABASES;

USE sql_concepts;
show tables;
select * from employee_data ORDER BY emp_salary DESC ;
-- The Second-Highest Salary
SELECT emp_salary FROM employee_data
GROUP BY emp_salary
LIMIT 1
OFFSET 1;

SELECT emp_name, emp_role, emp_salary
FROM employee_data WHERE emp_salary =
                   (SELECT DISTINCT emp_salary FROM employee_data GROUP BY emp_salary LIMIT 1 OFFSET 1)


-- Department-wise Count
SELECT emp_role, COUNT(*) AS emp_role_count
FROM employee_data GROUP BY emp_role ;

-- Duplicate role Instead of email
SELECT emp_role
FROM employee_data GROUP BY emp_role
HAVING COUNT(emp_role) > 1;

-- Salary Greater Than Manager:
SELECT e.Name, e.Salary, m.Name, m.Salary
FROM Employee e
JOIN Employee m
ON e.ManagerID = m.EmpID
WHERE e.Salary > m.Salary;

-- Join with Filter: Given an Orders table and a Customers table, find the CustomerName for all customers who placed an order in the last 30 days.
SELECT DISTINCT
    c.CustomerName
FROM customers c
JOIN orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderDate > CURRENT_DATE - INTERVAL '30' DAY