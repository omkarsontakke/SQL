SHOW DATABASES;

use company_db;

CREATE TABLE Person (
                          EmpID INT PRIMARY KEY,
                          FirstName VARCHAR(50),
                          LastName VARCHAR(50),
                          Salary INT,
                          DateOfJoining DATE,
                          DeptID INT,
                          Email VARCHAR(100)
);

INSERT INTO Person VALUES
                         (1, 'Omkar', 'Thomas', 50000, '2012-07-15', 1, 'Omkar@gmail.com'),
                         (2, 'Jayesh', 'Jones', 75000, '2020-03-10', 2, 'Jayesh@yahoo.com'),
                         (3, 'Rakmo', 'Brown', 90000, '2020-06-21', 1, 'Rakmo@outlook.com'),
                         (4, 'Gaurav', 'Sharma', 40000, '2019-01-01', 3, 'Gaurav@gmail.com'),
                         (5, 'Anuj', 'Agarwal', 80000, '2020-09-17', 2, 'Anuj@company.com'),
                         (6, 'Tejas', 'Gupta', 30000, '2018-05-11', 3, 'Tejas@gmail.com'),
                         (7, 'Shrivardhan', 'Verma', 60000, '2021-02-14', 1, 'Shrivardhan@org.com');

-- 1. SQL Query to update DateOfJoining to 15-jul-2012 for empid =1
UPDATE Person SET DateOfJoining='2012-07-14' WHERE EmpID=1;

-- 2. SQL Query to select all student name where salary is greater than 50000
SELECT FirstName FROM Person WHERE Salary>50000;

-- 3. SQL Query to Find all employee with Salary between 40000 and 80000
SELECT * FROM Person WHERE Salary BETWEEN 40000 AND 80000;

-- 4. SQL Query to display full name
SELECT CONCAT(FirstName," ", LastName) FROM Person;

-- 5. SQL Query to find name of employee beginning with S
SELECT FirstName FROM Person WHERE FirstName LIKE 'S%';

-- 6. Write a query to fetch details of employees whose firstname ends with an  alphabet ‘A’ and contains exactly five alphabets
SELECT * FROM Person WHERE FirstName LIKE '___J';

-- 7. Write a query to fetch details of all employees excluding few Employees
SELECT * FROM Person WHERE FirstName NOT IN('Anuj','jayesh');

-- 8. SQL query to display the current date
SELECT CURRENT_TIMESTAMP;

-- 9. Write an SQL query to fetch the employee FIRST names and replace the A with ‘@’
select REPLACE(Person.FirstName, 'A','@') from Person;

-- 10. Write an SQL query to fetch the domain from an email address
SELECT SUBSTR(Email, INSTR(Email,'@')+1) FROM Person;

-- 11. Write an SQL query to update the employee names by removing leading and trailing spaces
UPDATE Person SET FirstName = rtrim(ltrim(FirstName)) WHERE EmpID=1;

-- 12. Write an SQL query to fetch all the Employees details from Employee table who joined in the Year 2020
SELECT FirstName,LastName FROM Person WHERE DateOfJoining BETWEEN '2020-01-01' AND '2020-12-31';

-- 13. Write an SQL query to fetch only odd rows / Even rows from the table
SELECT * FROM Person WHERE MOD(EmpID,2); -- ODD
SELECT * FROM Person WHERE MOD(EmpID,2) = 0; -- EVEN

-- 14. CREATE A NEW TABLE FROM THE EXISTING TABLE
CREATE TABLE DATA AS (SELECT Person.FirstName FROM Person);
SELECT * FROM DATA;

-- 15. Write an SQL query to create an empty table with the same structure as some other table
CREATE TABLE DATA1 AS (SELECT LastName FROM Person WHERE 1=0);

-- 16. Write an SQL query to fetch top 3 HIGHEST salaries

SELECT Salary FROM Person ORDER BY Salary DESC
LIMIT 3

-- 17.  List the ways to get the count of records in a table
SELECT COUNT(*) FROM Person;
SELECT COUNT(Email) FROM person;

-- 18. GET ALL EMP whose salaries are greater than avg salary
SELECT FirstName, Person.Salary FROM Person
WHERE Salary > (SELECT AVG(Salary) FROM Person);

SELECT * FROM Person;



