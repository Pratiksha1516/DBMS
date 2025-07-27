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

--FULL JOIN
SELECT * 
FROM stud		
FULL JOIN course			-- like this also we can make or else we can use UNION of LEFT and RIGHT join
ON stud.id = course.id;

SELECT * 
FROM stud as s				-- with alias s(alternate name for student)
FULL JOIN course as c		-- with alias c(alternate name for course)
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
RIGHT JOIN course 
ON stud.id = course.id;

SELECT * 
FROM stud 
LEFT JOIN course 
ON stud.id = course.id
WHERE course.id IS NULL;

SELECT * 
FROM course 
LEFT JOIN stud 
ON course.id = stud.id
WHERE stud.id IS NULL;

 
