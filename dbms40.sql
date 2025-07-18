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

SELECT c.* 
FROM stud s
RIGHT JOIN course c ON s.id = c.id
WHERE s.id IS NULL;

SELECT s.name, c.course
FROM stud s
INNER JOIN course c ON s.id = c.id
WHERE c.course LIKE '%e%';

SELECT s.name 
FROM stud s
INNER JOIN course c ON s.id = c.id
WHERE c.course = 'Science';

SELECT COUNT(*) AS enrolled_students
FROM stud s
INNER JOIN course c ON s.id = c.id;

SELECT c.course, COUNT(s.id) AS student_count
FROM course c
LEFT JOIN stud s ON s.id = c.id
GROUP BY c.course;

SELECT * FROM stud
WHERE id IN (SELECT id FROM course);

SELECT course 
FROM course 
WHERE id IN (SELECT id FROM stud WHERE id > 101);

SELECT s.name, c.course
FROM stud s
LEFT JOIN course c ON s.id = c.id
ORDER BY s.name;

SELECT c.course, s.name
FROM course c
LEFT JOIN stud s ON s.id = c.id
ORDER BY c.course DESC;

SELECT DISTINCT c.course, s.name
FROM stud s
RIGHT JOIN course c ON s.id = c.id;

SELECT * FROM stud s
WHERE EXISTS (
  SELECT 1 FROM course c WHERE s.id = c.id
);

SELECT * FROM stud s
WHERE NOT EXISTS (
  SELECT 1 FROM course c WHERE s.id = c.id
);

SELECT s.id, s.name, c.course
FROM stud s
FULL OUTER JOIN course c ON s.id = c.id
WHERE COALESCE(s.id, c.id) > 102;
