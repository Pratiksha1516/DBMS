create table student(
stud_name varchar(30),
number int,
sex varchar(1)
);

insert into student(stud_name, number, sex) values
('prati', 15426, 'F'),
('ranveer', 2356, 'M'),
('Shree', 3456, 'F');

SELECT stud_name,number
FROM Student;

create table Teaching_Assistants(
subject varchar(20),
ID int);

insert into Teaching_Assistants(subject, ID) values
('Physics', 15426),
('Chemistry', 2356),
('Maths', 2645);

select * 
from student
inner join Teaching_Assistants
ON student.number=Teaching_Assistants.ID;

--
SELECT stud_name, number 
FROM student
WHERE sex = 'F';

SELECT stud_name 
FROM student
WHERE sex = 'M';

SELECT stud_name, subject
FROM student 
JOIN Teaching_Assistants 
ON student.number = Teaching_Assistants.ID;

SELECT stud_name 
FROM student
LEFT JOIN Teaching_Assistants 
ON student.number = Teaching_Assistants.ID
WHERE subject IS NULL;

SELECT subject 
FROM Teaching_Assistants
LEFT JOIN student 
ON student.number = Teaching_Assistants.ID
WHERE stud_name IS NULL;

SELECT sex, COUNT(*) 
FROM student
GROUP BY sex;

SELECT stud_name, number 
FROM student
ORDER BY number DESC
LIMIT 1;

SELECT stud_name, number 
FROM student
ORDER BY number ASC
LIMIT 1;

SELECT stud_name, subject 
FROM student s
JOIN Teaching_Assistants t 
ON s.number = t.ID;

SELECT stud_name, subject 
FROM student s
LEFT JOIN Teaching_Assistants t 
ON s.number = t.ID;

SELECT subject, stud_name 
FROM Teaching_Assistants t
LEFT JOIN student s 
ON s.number = t.ID;

SELECT subject, COUNT(stud_name) AS total_students
FROM Teaching_Assistants t
LEFT JOIN student s 
ON s.number = t.ID
GROUP BY subject;

SELECT * 
FROM student
WHERE stud_name LIKE 'R%';

SELECT * 
FROM student
WHERE stud_name LIKE '%e';

SELECT stud_name, number 
FROM student
WHERE number > 5000;

SELECT DISTINCT subject 
FROM Teaching_Assistants;

UPDATE Teaching_Assistants
SET subject = 'Mathematics'
WHERE subject = 'Maths';

DELETE FROM student
WHERE stud_name = 'Shree';

SELECT AVG(number) AS avg_number
FROM student;
