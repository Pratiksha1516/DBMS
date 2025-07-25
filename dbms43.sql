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

SELECT name 
FROM employee
WHERE manager_id IS NULL;

SELECT name 
FROM employee 
WHERE manager_id IS NOT NULL;

SELECT * FROM employee 
WHERE name LIKE 'a%';

SELECT * FROM employee 
WHERE id > 102;

SELECT * FROM employee
ORDER BY name;

SELECT * FROM employee ORDER BY manager_id DESC;

SELECT f.name AS employee, e.name AS manager
FROM employee f
JOIN employee e ON f.manager_id = e.id;

SELECT e.name AS employee, m.name AS manager
FROM employee e
LEFT JOIN employee m ON e.manager_id = m.id;

SELECT m.name AS manager, e.name AS employee
FROM employee m
JOIN employee e ON m.id = e.manager_id;

SELECT manager_id, COUNT(*) AS num_employees
FROM employee
WHERE manager_id IS NOT NULL
GROUP BY manager_id;

SELECT m.name AS manager, COUNT(e.id) AS num_subordinates
FROM employee m
JOIN employee e ON m.id = e.manager_id
GROUP BY m.name;

SELECT name,
  CASE 
    WHEN manager_id IS NULL THEN 'No Manager'
    ELSE 'Has Manager'
  END AS manager_status
FROM employee;

SELECT DISTINCT e.name AS manager
FROM employee e
JOIN employee f ON e.id = f.manager_id;

SELECT name 
FROM employee 
WHERE manager_id = (
  SELECT id FROM employee WHERE name = 'casey'
);

SELECT name 
FROM employee 
WHERE id NOT IN (SELECT DISTINCT manager_id FROM employee WHERE manager_id IS NOT NULL);

SELECT name
FROM employee
WHERE manager_id IN (
  SELECT id FROM employee WHERE name IN ('casey', 'donald')
);

SELECT DISTINCT m.name
FROM employee m
WHERE EXISTS (
  SELECT 1 FROM employee e WHERE e.manager_id = m.id
);

SELECT e.name
FROM employee e
WHERE NOT EXISTS (
  SELECT 1 FROM employee m WHERE e.manager_id = m.id
);
