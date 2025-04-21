CREATE DATABASE STUDENT;

CREATE TABLE stud(
id INT PRIMARY KEY,
name VARCHAR(20)
);

INSERT INTO stud(id, name)
VALUES
(101, 'adam'),
(102, 'bob'),
(103, 'casey');

CREATE TABLE course(
id INT PRIMARY KEY,
course VARCHAR(50)
);

INSERT INTO course
(id, course)
VALUES
(102, 'English'),
(105, 'Math'),
(103, 'Science'),
(107, 'Computer Science');

SELECT * FROM stud;

SELECT * FROM course;

--LEFT EXCLUSIVE JOIN( DATA PRESENT  ONLY IN stud)
SELECT * 
FROM stud		
FULL JOIN course			
ON stud.id = course.id
WHERE course.id IS NULL;

--RIGHT EXCLUSIVE JOIN (DATA PRESENT ONLY IN COURSE)
SELECT * 
FROM stud as s				-- with alias s(alternate name for student)
RIGHT JOIN course as c		-- with alias c(alternate name for course)
ON s.id = c.id
WHERE s.id IS NULL;

--FULL EXCLUSIVE JOIN( data present only in stud and course table)
SELECT * 
FROM stud		
FULL JOIN course			
ON stud.id = course.id
WHERE stud.id IS NULL OR course.id IS NULL;


