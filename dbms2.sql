create table emp(
    emp_id int primary key,
    emp_name varchar(20),
    emp_age int,
    emp_salary int,
    emp_dep varchar(15)
);

INSERT INTO emp
(emp_id, emp_name, emp_age, emp_Salary, emp_dep)
VALUES  
(1, 'prati', 20, 1000000, 'database'),
(2, 'ranveer', 20, 90000000, 'full stack'),
(3, 'shiri', 20, 90000000, 'designing');

select * 
from emp
where emp_dep = 'full stack';

select * 
from emp 
where emp_salary > 100000;

select * 
from emp 
where emp_age > 20;   

select * 
from emp 
where emp_age < 10;

SELECT * FROM emp
WHERE LENGTH(emp_name) = 5;

select * 
from emp 
where emp_name like = '_____i%';

select * from emp
where emp_name like = 's%___';

select emp_name
from emp
where emp_name like 'r%';

select *
from emp
where emp_dep like 'd%';

select *
from emp
where emp_dep like 'f%';

select emp_age
from emp
where emp_name = 'prati';

select emp_salary
from emp
where emp_id = 3;

select emp_name
from emp
where emp_dep = 'database';

select emp_salary
from emp
where emp_dep = 'full stack';

select emp_name
from emp
where emp_id = 2;

select emp_age
from emp
where emp_name = 'shiri';

select emp_dep
from emp
where emp_id = 3;

select SUM(emp_Salary)
from emp;

SELECT * 
FROM emp 
WHERE emp_dep = 'database';

SELECT * 
FROM emp 
WHERE emp_name LIKE '%i';

SELECT * 
FROM emp
WHERE LENGTH(emp_dep) = 9;

SELECT * FROM emp
WHERE emp_dep LIKE '%a%';

SELECT * 
FROM emp 
WHERE emp_name LIKE '%a%';

SELECT * 
FROM emp 
ORDER BY emp_age ASC, emp_salary DESC;

SELECT * 
FROM emp 
WHERE emp_dep <> 'designing';

SELECT emp_dep, AVG(emp_salary) AS avg_sal 
FROM emp 
GROUP BY emp_dep;

SELECT emp_dep, COUNT(*) AS emp_count 
FROM emp 
GROUP BY emp_dep HAVING COUNT(*) > 1;

SELECT emp_dep, MAX(emp_salary) AS max_sal 
FROM emp 
GROUP BY emp_dep;

SELECT emp_dep, MIN(emp_age) AS min_age 
FROM emp 
GROUP BY emp_dep;

SELECT *
FROM emp 
WHERE emp_salary > (SELECT AVG(emp_salary) FROM emp);

SELECT *
FROM emp
WHERE emp_salary = (SELECT MAX(emp_salary) FROM emp);

SELECT * 
FROM emp 
WHERE emp_dep = (SELECT emp_dep FROM emp WHERE emp_id = 1);

SELECT * 
FROM emp
WHERE emp_name LIKE '%r';

SELECT * 
FROM emp 
WHERE emp_salary BETWEEN 500000 AND 95000000;

SELECT * 
FROM emp 
WHERE emp_age = 20 AND emp_dep = 'full stack';

SELECT emp_name 
FROM emp 
WHERE emp_salary > (SELECT emp_salary FROM emp WHERE emp_name = 'prati');

SELECT * FROM emp 
WHERE emp_dep NOT IN ('full stack', 'database');

SELECT emp_dep, SUM(emp_salary) AS total_salary
FROM emp
GROUP BY emp_dep
HAVING SUM(emp_salary) > 100000000;

SELECT AVG(emp_age)
FROM emp
WHERE emp_dep LIKE 'd%';

SELECT * FROM emp
WHERE emp_salary = (
    SELECT emp_salary FROM emp WHERE emp_name = 'ranveer'
);

UPDATE emp
SET emp_salary = emp_salary * 1.10
WHERE emp_dep = 'designing';

--Aggregate functions
SELECT COUNT(emp_id)
FROM emp;

SELECT MAX(emp_salary)
FROM emp;

SELECT AVG(emp_salary)
FROM emp;

SELECT MIN(emp_salary)
FROM emp;

SELECT SUM(emp_salary)
FROM emp 
WHERE emp_dep = 'designing';

SELECT AVG(emp_age) 
FROM emp;

SELECT * FROM emp
WHERE emp_name LIKE '%i' AND emp_age = 20;

SELECT COUNT(*) 
FROM emp 
WHERE emp_salary > 1000000;

SELECT emp_dep, emp_name
FROM emp 
WHERE emp_salary = (SELECT MAX(emp_salary) FROM emp);

SELECT emp_age, COUNT(*) AS age_count
FROM emp
GROUP BY emp_age;

--UPDATE queries
UPDATE emp
SET emp_name = 'pratiksha'
WHERE emp_id = 1;

--

SELECT emp_name,
       emp_salary,
       CASE 
           WHEN emp_salary >= 90000000 THEN 'High'
           WHEN emp_salary >= 1000000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_category
FROM emp;

SELECT emp_name, emp_age,
  CASE 
    WHEN emp_age < 20 THEN 'Teen'
    WHEN emp_age = 20 THEN 'Young Adult'
    ELSE 'Adult'
  END AS age_category
FROM emp;

--

SELECT * FROM emp 
ORDER BY emp_salary DESC 
LIMIT 2;

SELECT * FROM emp 
ORDER BY emp_age DESC 
LIMIT 1;

--
UPDATE emp
SET emp_dep = 'UI/UX'
WHERE emp_name = 'shiri';

--
DELETE FROM emp
WHERE emp_salary < 100000;

--
SELECT * FROM emp
WHERE emp_name LIKE '%i' AND LENGTH(emp_name) > 5;

SELECT emp_name, UPPER(emp_dep) AS upper_dep FROM emp;

SELECT emp_name, SUBSTRING(emp_name FROM 1 FOR 3) AS short_name FROM emp;

SELECT SUM(emp_salary) AS total_salary, AVG(emp_salary) AS avg_salary FROM emp;

SELECT emp_dep
FROM emp
GROUP BY emp_dep
ORDER BY SUM(emp_salary) DESC
LIMIT 1;

SELECT emp_name, emp_salary,
RANK() OVER (ORDER BY emp_salary DESC) AS salary_rank
FROM emp;

SELECT emp_dep, emp_name, emp_salary,
SUM(emp_salary) OVER (PARTITION BY emp_dep ORDER BY emp_salary DESC) AS cumulative_salary
FROM emp;

SELECT * FROM emp
WHERE emp_dep NOT IN ('UI/UX', 'full stack');

SELECT * FROM emp
WHERE emp_salary % 1000000 = 0;

SELECT emp_name, emp_salary, emp_salary * 1.15 AS increased_salary
FROM emp;

SELECT emp_name, emp_age,
emp_age - (SELECT MIN(emp_age) FROM emp) AS age_difference
FROM emp;

SELECT * FROM emp
WHERE emp_salary > 2 * (SELECT emp_salary FROM emp WHERE emp_name = 'prati');

SELECT * FROM emp
WHERE emp_dep = (
SELECT emp_dep FROM emp
WHERE emp_salary = (SELECT MIN(emp_salary) FROM emp)
);

SELECT * FROM emp
WHERE emp_age > (
SELECT AVG(emp_age) FROM emp WHERE emp_dep = 'UI/UX'
);
