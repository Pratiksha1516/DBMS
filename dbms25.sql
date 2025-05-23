CREATE TABLE IF NOT EXISTS emp(
id INT,
salary INT DEFAULT 50000,
branch VARCHAR DEFAULT 'software'
);

INSERT INTO emp (id) -- Here i have used default constraint so no need of inserrting salary and branch attribute
VALUES 
(1),
(2),
(3);

SELECT * FROM emp;

--Aggregation function
SELECT COUNT(*)
FROM emp;

SELECT MAX(salary)
FROM emp;

SELECT SUM(salary)
FROM emp;

SELECT AVG(salary)
FROM emp;

--Update query
UPDATE emp
SET branch = 'hardware'
WHERE id = 2;

UPDATE emp
SET salary = 3000
WHERE branch = 'hardware';

UPDATE emp
SET branch = 'data analytics'
WHERE id = 3;

UPDATE emp
SET branch = 'data analytics', salary = 100000
WHERE id = 3;

--SELECT 
SELECT branch 
FROM emp
WHERE id = 1;

SELECT salary
FROM emp
WHERE branch = 'data analytics';
