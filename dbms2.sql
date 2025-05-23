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

--Aggregate functions
SELECT COUNT(emp_id)
FROM emp;

SELECT MAX(emp_salary)
FROM emp;

SELECT AVG(emp_salary)
FROM emp;

SELECT MIN(emp_salary)
FROM emp;

--UPDATE queries
UPDATE emp
SET emp_name = 'pratiksha'
WHERE emp_id = 1;

