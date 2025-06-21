CREATE DATABASE xyz_company;

CREATE TABLE IF NOT EXISTS employee2(
id INT PRIMARY KEY,
name VARCHAR (50),
salary INT
);

INSERT INTO employee2 (id, name, salary)
VALUES
(1, 'ADAM', 25000),
(2, 'BOB', 30000),
(3, 'CASEY', 40000);

SELECT * FROM employee2;

SELECT *
FROM employee2
WHERE salary > 25000;

SELECT *
FROM employee2
WHERE salary > 30000;
