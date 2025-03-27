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

select * from emp where emp_dep = 'full stack';

select * from emp where emp_salary > 100000;

select * from emp where emp_age > 20;   

select * from emp where emp_age < 10;

select * from emp where emp_name like = '_____i%';
