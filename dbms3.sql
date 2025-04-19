create table emp(
    emp_id int primary key,
    emp_name varchar(20),
    emp_age int,
    emp_salary int,
    emp_dep varchar(15)
);

INSERT INTO emp VALUES  (1, 'prati', 20, 1000000, 'database');
INSERT INTO emp VALUES   (2, 'ranveer', 20, 90000000, 'full stack');
INSERT INTO emp VALUES   (3, 'shiri', 20, 90000000, 'designing');

select emp_name from emp where emp_age < 26;

select max(emp_salary) AS highest_salary from emp;

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

delete from emp where emp_id = 1;

truncate table emp;

drop table emp;
