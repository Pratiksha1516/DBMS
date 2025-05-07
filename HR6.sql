create table student(
stud_name varchar(30),
number int,
sex varchar(1)
);

insert into student(stud_name, number, sex) values
('prati', 15426, 'F'),
('ranveer', 2356, 'M'),
('Shree', 3456, 'F');

create table Teaching_Assistants(
subject varchar(20),
ID int);

insert into Teaching_Assistants(subject, ID) values
('Physics', 15426),
('Chemistry', 2356),
('Maths', 2645);

SELECT stud_name,number
FROM Student;

select * 
from student
inner join Teaching_Assistants
ON student.number=Teaching_Assistants.ID;
