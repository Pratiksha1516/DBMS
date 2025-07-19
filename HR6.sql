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

--Aggregate functions
SELECT MAX(number)
FROM(
	SELECT number FROM student
	UNION ALL
	SELECT ID from Teaching_Assistants
);

SELECT SUM(number)
FROM(
	SELECT number FROM student
	UNION ALL
	SELECT ID from Teaching_Assistants
);

SELECT SUM(number)
FROM student;

SELECT SUM(number)
FROM(
	SELECT number FROM student
	EXCEPT
	SELECT ID from Teaching_Assistants
);

select * 
from student
inner join Teaching_Assistants
ON student.number=Teaching_Assistants.ID;


__
SELECT * FROM student
WHERE sex = 'F';

SELECT * FROM student 
WHERE sex = 'M';

SELECT * FROM student 
WHERE number > 3000;

SELECT * FROM student 
WHERE stud_name LIKE 'S%';

SELECT * FROM student
WHERE number NOT IN (SELECT ID FROM Teaching_Assistants);
