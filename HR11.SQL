create table Employee(
	employee_id int primary key,
	name varchar(20),
	months int,
	salary int
);

INSERT INTO Employee (employee_id, name, months, salary) VALUES
(12228, 'Rose', 15, 1968),
(33645, 'Angela', 1, 3443),
(45692, 'Frank', 17, 1608),
(56118, 'Patrick', 7, 1345),
(59725, 'Lisa', 11, 2330),
(74197, 'Kimberly', 16, 4372),
(78454, 'Bonnie', 8, 1771),
(83565, 'Michael', 6, 2017),
(98607, 'Todd', 5, 3396),
(99989, 'Joe', 9, 3573);

select name
from Employee
order by name asc;

select name
from Employee 
where salary > 2000 and months < 10
order by employee_id asc;

SELECT COUNT(name)
FROM employee;

SELECT MAX(salary)
FROM employee;

SELECT MIN(salary)
FROM employee;

SELECT SUM(salary)
FROM employee;

SELECT AVG(salary)
FROM employee;

SELECT name, salary
FROM employee
WHERE name LIKE '%a';

SELECT name, salary
FROM employee
WHERE name LIKE '_o%';

SELECT name
FROM employee
WHERE name LIKE '%e';

SELECT name, salary
FROM employee 
WHERE months > 10;

SELECT employee_id,name
FROM employee
WHERE months < 10;

SELECT *
FROM employee
where name LIKE '_____%';

SELECT name, months * salary AS annual_salary
FROM Employee;

SELECT name, months
FROM Employee
WHERE months > (SELECT AVG(months) FROM Employee);

SELECT name, salary
FROM Employee
ORDER BY salary DESC
LIMIT 3;

SELECT name, salary,
  CASE
    WHEN salary >= 4000 THEN 'High'
    WHEN salary >= 2000 THEN 'Medium'
    ELSE 'Low'
  END AS salary_level
FROM Employee;

SELECT name
FROM Employee
WHERE LOWER(SUBSTR(name, 1, 1)) = LOWER(SUBSTR(name, -1));

SELECT COUNT(*)
FROM Employee
WHERE LENGTH(name) > 5;

SELECT name, salary
FROM Employee
WHERE salary = (
  SELECT MAX(salary)
  FROM Employee
  WHERE salary < (
    SELECT MAX(salary) FROM Employee
  )
);

SELECT name, salary
FROM Employee
WHERE salary % 5 = 0;

SELECT name, REVERSE(name) AS reversed_name
FROM Employee;
