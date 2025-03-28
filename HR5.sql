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
where sec = 'F';

select count(*)
from student
where number > 3000;
