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

--INNER JOIN
SELECT * 
FROM stud
INNER JOIN course
ON stud.id = course.id;

SELECT * 
FROM stud as s				-- with alias s(alternate name for student)
INNER JOIN course as c		-- with alias c(alternate name for course)
ON s.id = c.id;

SELECT COUNT(name)
FROM stud;

SELECT COUNT(course)
FROM course;

SELECT DISTINCT id
FROM stud
UNION 
SELECT id
FROM course;

SELECT name
FROM stud
WHERE name LIKE 'a%';

SELECT course
FROM course
WHERE course LIKE '%h';

SELECT name, id
FROM stud
WHERE name LIKE '_o%'
UNION
SELECT course,id
FROM course
WHERE course LIKE '_o%';
