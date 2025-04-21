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
