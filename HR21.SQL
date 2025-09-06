create table Employee(
	employee_id int,
	name varchar,
	months int,
	salary int
);

drop table Employee;

insert into Employee(employee_id, name, months, salary)
values
(12228, 'Rose', 15, 1968),
(33645, 'Angela', 1, 3443),
(45692, 'Frank', 17, 1608),
(56118, 'Patrick', 7, 1345),
(59725, 'Lisa', 11, 2330),
(74197, 'Kimberly', 16, 4372),
(78454, 'Bonnie', 8, 1771),
(83565, 'Machael', 6, 2017),
(98607, 'Todd', 5, 3396),
(99989, 'Joe', 9, 3573);

-- max salary as well as total number employee thye have
SELECT 
    MAX(salary * months) AS max_total_earnings,
    COUNT(*) AS employee_count
FROM Employee
WHERE salary * months = (
    SELECT MAX(salary * months)
    FROM Employee
);

--
SELECT * 
FROM Employee;

SELECT name, salary 
FROM Employee
WHERE salary = (SELECT MAX(salary) FROM Employee);

SELECT name, salary 
FROM Employee
WHERE salary = (SELECT MIN(salary) FROM Employee);

SELECT COUNT(*) AS total_employees 
FROM Employee;

SELECT AVG(salary) AS avg_salary 
FROM Employee;
