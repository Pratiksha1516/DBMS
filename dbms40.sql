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

--RIGHT JOIN
SELECT * 
FROM stud
RIGHT JOIN course
ON stud.id = course.id;

SELECT * 
FROM stud as s				-- with alias s(alternate name for student)
RIGHT JOIN course as c		-- with alias c(alternate name for course)
ON s.id = c.id;

 
--
SELECT * 
FROM stud
INNER JOIN course
ON stud.id = course.id;

SELECT * 
FROM stud
LEFT JOIN course
ON stud.id = course.id;

SELECT * 
FROM stud
FULL OUTER JOIN course
ON stud.id = course.id;

SELECT s.name, c.course 
FROM stud s 
RIGHT JOIN course c 
ON s.id = c.id;

SELECT s.* 
FROM stud s
LEFT JOIN course c ON s.id = c.id
WHERE c.id IS NULL;
