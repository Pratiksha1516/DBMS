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

SELECT *
FROM employee2
WHERE name LIKE 'C%';

SELECT COUNT(*)
FROM employee2;

SELECT MAX(salary)
FROM employee2;

SELECT MIN(salary)
FROM employee2;

SELECT AVG(salary)
FROM employee2;

SELECT SUM(salary)
FROM employee;

SELECT *
FROM employee2
ORDER BY salary ASC;

SELECT *
FROM employee2
ORDER BY salary DESC;

UPDATE employee2
SET salary =35000
WHERE name = 'BOB';

UPDATE employee2
SET salary = salary* 1.10;

DELETE FROM employee2
WHERE id = 2;

UPDATE employee2 
SET name = 'CHRIS'
WHERE name = 'CASEY';

SELECT *
FROM employee2
WHERE salary BETWEEN 25000 AND 35000;

SELECT name
FROM employee2;

SELECT id 
FROM employee2
WHERE salary < 35000;

SELECT *
FROM employee2
WHERE salary > 50000;

INSERT INTO employee2(id, name, salary)
VALUES(4, 'RANVEER', 1000000);
