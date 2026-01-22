SHOW DATABASES;

USE db_company;

SHOW TABLES ;

SELECT * from employee_details;

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(10)
);

DESC department;

INSERT INTO department (dept_id, dept_name)
    values (1,"IT"),
    (2,"CIVIL"),
    (3,"CYBER"),
    (4,"MECHANICAL");

-- Cascading concept

CREATE TABLE instagram (
    user_id int PRIMARY KEY,
    user_name varchar(20) NOT NULL
);

CREATE TABLE post (
    post_id int PRIMARY KEY ,
    user_name varchar(20),
    post_name varchar(20),
    user_id int,
    FOREIGN KEY (user_id)
                REFERENCES instagram(user_id)
                  ON DELETE CASCADE
                  ON UPDATE CASCADE
);


INSERT INTO instagram VALUES
                          (3, 'Google'),
                          (4, 'JP Morgan');

INSERT INTO post VALUES
                          (101, 'Google', "GoogleCloudPost",1),
                          (102, 'Microsoft', "MicrosoftAzurePost",2),
                          (103, 'JP Morgan', "JPMorganPost",1),
                          (104, 'Google',"GooglePayPost" ,4);

SELECT * from instagram;
SELECT * from post;

DELETE FROM instagram WHERE user_id=1;
UPDATE instagram SET user_name ="JP_Morgan" WHERE user_id=4;

