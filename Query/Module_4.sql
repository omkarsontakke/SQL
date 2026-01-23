show databases;

USE company_db;

SHOW TABLES;

CREATE TABLE department(
    dept_id int PRIMARY KEY,
    dept_name varchar(20)
);
INSERT INTO department (dept_id, dept_name) VALUES
                                                (1, 'HR'),
                                                (2, 'Finance'),
                                                (3, 'IT'),
                                                (4, 'Marketing'),
                                                (5, 'Sales');
CREATE TABLE employees(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(255),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

INSERT INTO employees (emp_id,emp_name, dept_id) VALUES
                                              (7,'Omkar Sontakke', 7),
                                              (9,'Shraddha Sontakke', 9);

ALTER TABLE employees ADD COLUMN salary DECIMAL(10,2);

-- 1.INNER JOIN:- Returns only matching record from both tables.

SELECT e.emp_id, e.emp_name, d.dept_id
FROM employees e
INNER JOIN department d
ON e.dept_id = d.dept_id;

SELECT * FROM employees;
TRUNCATE TABLE department;

SET FOREIGN_KEY_CHECKS = 1;

DESC employees;

INSERT INTO department (dept_id, dept_name) VALUES
                                                (1, 'HR'),
                                                (2, 'Finance'),
                                                (3, 'IT'),
                                                (4, 'Marketing');

DELETE FROM department WHERE dept_name="IT";

INSERT INTO employees (emp_name, dept_id, salary) VALUES
                                                      ('Alice Johnson', 1, 45000.00),
                                                      ('Bob Smith', 2, 52000.50),
                                                      ('Charlie Brown', 3, 65000.00),
                                                      ('Diana Prince', 3, 72000.75),
                                                      ('Ethan Hunt', 4, 58000.00),
                                                      ('Fiona Davis', 5, 60000.00),
                                                      ('George Miller', 2, 54000.25),
                                                      ('Hannah Wilson', 1, 48000.00);

SELECT e.emp_id,e.emp_name,d.dept_name
    FROM employees e
INNER JOIN department d
ON e.dept_id = d.dept_id;

SELECT e.emp_id, e.emp_name, d.dept_name
    FROM employees e
LEFT JOIN department d
ON e.dept_id = d.dept_id;


CREATE TABLE Students (
                          student_id INT PRIMARY KEY,
                          student_name VARCHAR(50),
                          grade VARCHAR(10)
);

CREATE TABLE Courses (
                         course_id INT PRIMARY KEY,
                         course_name VARCHAR(50),
                         student_id INT
);

INSERT INTO Students VALUES
                         (1, 'Alex', 'A'),
                         (2, 'Bella', 'B'),
                         (3, 'Chris', 'A'),
                         (4, 'Diana', 'C');

INSERT INTO Courses VALUES
                        (101, 'Math', 1),      -- Alex
                        (102, 'Science', 2),   -- Bella
                        (103, 'History', 5),   -- No such student
                        (104, 'Art', NULL);    -- No student assigned


SELECT e.course_name, d.student_name
FROM Courses e
CROSS JOIN Students d;
