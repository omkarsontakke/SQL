show databases;

use sql_concepts;

show tables;

select * FROM employee_data;

-- below create the procedure without parameter that return the first 10 employee from the table.
DELIMITER $$
CREATE PROCEDURE select_emp_data()
BEGIN
    SELECT * FROM employee_data
    LIMIT 7;
end $$
DELIMITER ;


show create procedure select_emp_data;
call select_emp_data();

EXEC


-- create parameter procedure that find employee data by their name
DELIMITER ^^
CREATE PROCEDURE EMP_DATA_BY_NAME(IN E_NAME VARCHAR(20))
BEGIN
    SELECT * FROM employee_data WHERE emp_name=E_NAME;
end ^^
DELIMITER ;

CALL EMP_DATA_BY_NAME("rakmo Sontakke");

SELECT SUM(emp_salary) FROM employee_data WHERE emp_role = "Software Engineer";

-- CREATE PRODUCER THAT TAKE THE PARAMETER AND RETURN SOME VALUE

DELIMITER **
CREATE PROCEDURE GET_SUM_OF_DEPARTMENT_SALARY(IN E_ROLE VARCHAR(20), OUT E_SUM DECIMAL(10,2))
BEGIN
    SELECT SUM(emp_salary) INTO E_SUM FROM employee_data WHERE emp_role=E_ROLE;
END **

DELIMITER ;

SET @E_SUM = 0;

CALL GET_SUM_OF_DEPARTMENT_SALARY("Software Engineer",@E_SUM );

SELECT @E_SUM;
