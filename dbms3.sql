create table emp(
    emp_id int primary key,
    emp_name varchar(20),
    emp_age int,
    emp_salary int,
    emp_dep varchar(15)
);

INSERT INTO emp(emp_id, emp_name, emp_age, emp_salary, emp_dep)
VALUES  
(1, 'prati', 20, 1000000, 'database'),
(2, 'ranveer', 20, 90000000, 'full stack'),
(3, 'shiri', 20, 90000000, 'designing');

--aggregation functions
SELECT COUNT(emp)
FROM emp;

SELECT MAX(emp_salary)UPDATE query
FROM emp;

SELECT MIN(emp_salary)
FROM emp;

SELECT AVG(emp_salary)
FROM emp;

SELECT SUM(emp_salary) AS total_salary 
FROM emp;

SELECT COUNT(*) AS total_employees 
FROM emp 
WHERE emp_age = 20;

SELECT emp_dep, COUNT(*) AS dept_count
FROM emp 
GROUP BY emp_dep;

--UPDATE QUERY
UPDATE emp
SET emp_age =18
WHERE emp_id = 3;

UPDATE emp
SET emp_dep = 'CLOUD COMPUTING'
WHERE emp_id = 2;


select emp_name 
from emp 
where emp_age < 26;

select max(emp_salary) AS highest_salary from emp;

select *
from emp
where emp_salary > 2000000
limit 2;

select *
from emp
order by emp_salary desc;

select *
from emp
order by emp_id desc
limit 2;

select * 
from emp
limit 2;

SELECT emp_name, emp_salary AS highest_salary
FROM emp
WHERE emp_salary = (SELECT MAX(emp_salary) FROM emp);

select name
from emp
where emp_ dep = 'database';

select emp_age
from emp
where emp_salary = 90000000;

select emp_dep
from emp
where emp_id = 2;

SELECT * 
FROM emp 
WHERE emp_salary BETWEEN 500000 AND 2000000;

SELECT * 
FROM emp 
WHERE emp_dep <> 'full stack';

SELECT * 
FROM emp 
WHERE emp_name LIKE '%a';

SELECT * 
FROM emp
WHERE emp_name ILIKE 'p%';

SELECT * 
FROM emp 
WHERE emp_age IN (18, 20);

SELECT emp_dep, AVG(emp_salary) AS avg_dep_salary 
FROM emp
GROUP BY emp_dep;

SELECT emp_dep 
FROM emp GROUP BY emp_dep HAVING COUNT(*) > 1;
