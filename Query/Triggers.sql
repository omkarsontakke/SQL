SHOW DATABASES;

CREATE DATABASE sql_concepts;

USE sql_concepts;

SHOW TABLES;

CREATE TABLE employee_data
(
    emp_id              int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    emp_name            varchar(100)       NOT NULL,
    emp_salary          DECIMAL(10, 2),
    emp_role            varchar(25),
    emp_city            varchar(25),
    emp_branch_location varchar(25),
    emp_manager_name    varchar(25)
);

INSERT INTO employee_data
(emp_name, emp_salary, emp_role, emp_city, emp_branch_location, emp_manager_name)
VALUES
    ('Anita Sontakke', 97000.00, 'Software Engineer', 'Mumbai', 'BTM Layout', 'Shraddha Sontakke'),
    ('Omkar Sontakke', 79000.00, 'Software Engineer', 'Mumbai', 'Andheri', 'Rakmo Sontakke'),
    ('Amit Patel', 48000.00, 'QA Engineer', 'Ahmedabad', 'Navrangpura', 'Kunal Kudpane'),
    ('Neha Singh', 75000.00, 'Project Manager', 'Delhi', 'Connaught Place', 'Rakesh Jha'),
    ('Vikram Rao', 68000.00, 'DevOps Engineer', 'Hyderabad', 'Hitech City', 'Aboli Sontakke'),
    ('Sneha Kulkarni', 52000.00, 'HR Executive', 'Pune', 'Hinjewadi', 'Meera Joshi'),
    ('Arjun Malhotra', 23000.00, 'Tech Lead', 'Gurgaon', 'Cyber City', 'Sanjay Bansal'),
    ('Kavya Reddy', 46000.00, 'Support Engineer', 'Pune', 'Guindy', 'Prakash Menon');


-- BEFORE EVENT

DELIMITER //
CREATE TRIGGER salary_check_before_insert
BEFORE INSERT ON employee_data
FOR EACH ROW
BEGIN
    IF NEW.emp_salary < 0 THEN
        SET NEW.emp_salary = 1;
    end if;
end //

DELIMITER ;

INSERT INTO employee_data
(emp_name, emp_salary, emp_role, emp_city, emp_branch_location, emp_manager_name)
VALUES
    ('Apurva Sontakke', -45000.00, 'Sales Manager', 'Panvel', 'Seawood', 'Omkar Sontakke');


ALTER TABLE employee_data DROP COLUMN joining_date;

ALTER TABLE employee_data ADD COLUMN joining_date DATE NOT NULL DEFAULT '2002-03-07';

SELECT * FROM employee_data;

DELIMITER //
CREATE TRIGGER set_role_user_bydefault
AFTER UPDATE ON employee_data
FOR EACH ROW
BEGIN
    IF NEW.emp_role = 'ADMIN' THEN
        SET emp_role = 'USER';
    end if;
end //