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

--self join(it joins data within one table )
SELECT e.name as manager_name, f.name
FROM employee as e
JOIN employee as f   
ON e.id = f.manager_id;


--
SELECT name, manager_id 
FROM employee;
