create table student(
stud_name varchar(30),
number int,
sex varchar(1)
);

insert into student(stud_name, number, sex) values
('prati', 15426, 'F'),
('ranveer', 2356, 'M'),
('Shree', 3456, 'F');

select * from student;

select * 
from stdent
where sex = 'F';

select count(*)
from student
where number > 3000;

select number
from student
where sex = 'F';

select sex
from student
where number = 2356;

--Aggregate functions
SELECT COUNT(*)
FROM student;

SELECT MAX(number)
FROM student;

SELECT MIN(number)
FROM student;

SELECT SUM(number)
FROM student;
