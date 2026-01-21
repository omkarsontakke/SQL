CREATE DATABASE db_company;

USE db_company;

CREATE TABLE employee(
    emp_id int,
    name varchar(255),
    salary double
);

INSERT INTO employee VALUES(1,"Omkar",790000);
INSERT INTO employee VALUES(2,"Shraddha",970000),(3,"Apurva",970000);
INSERT INTO employee VALUES(2,"Aboli",970000),(4,"Apurva",970000);
SELECT * FROM employee;