CREATE TABLE employee(
id INT PRIMARY KEY,
name VARCHAR(40),
manager_id INT
);

INSERT INTO employee
(id, name, manager_id)
VALUES
(101, 'adam', 103),
(102, 'bob', 104),
(103, 'casey', NULL),
(104, 'donald', 103);

SELECT * FROM employee;

--UNION( it does not allow duplicate values)
SELECT name FROM employee
UNION
SELECT name FROM employee;

--UNION ALL(including duplicate values)
SELECT name FROM employee
UNION ALL
SELECT name FROM employee;

--
SELECT name, manager_id FROM employee;

SELECT name FROM employee 
WHERE manager_id IS NOT NULL;

SELECT name FROM employee 
WHERE manager_id IS NULL;

SELECT DISTINCT e1.name AS manager_name
FROM employee e1
JOIN employee e2 ON e1.id = e2.manager_id;

SELECT COUNT(*) AS total_employees FROM employee;

SELECT * FROM employee ORDER BY name;

SELECT * FROM employee
WHERE name LIKE 'a%';

SELECT * FROM employee 
WHERE name LIKE '%d';

SELECT * FROM employee 
WHERE name LIKE '%a%';

SELECT * FROM employee
WHERE manager_id = 103;

SELECT e.name AS employee_name, m.name AS manager_name
FROM employee e
LEFT JOIN employee m ON e.manager_id = m.id;
