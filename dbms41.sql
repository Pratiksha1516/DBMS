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

SELECT stud.id 
FROM stud 
INNER JOIN course 
ON stud.id = course.id;

SELECT id 
FROM stud 
WHERE id NOT IN (SELECT id FROM course);

SELECT id 
FROM course 
WHERE id NOT IN (SELECT id FROM stud);

SELECT id FROM stud
UNION
SELECT id FROM course;

SELECT id FROM stud
UNION ALL
SELECT id FROM course;

SELECT id FROM stud
UNION
SELECT id FROM course
ORDER BY id;

SELECT s.name, c.course 
FROM stud s 
JOIN course c 
ON s.id = c.id;

SELECT 
    (SELECT COUNT(*) FROM stud) AS student_count,
    (SELECT COUNT(*) FROM course) AS course_count;

SELECT id 
FROM stud 
WHERE id IN (SELECT id FROM course);

SELECT * 
FROM stud s 
WHERE EXISTS (SELECT 1 FROM course c WHERE c.id = s.id);

SELECT * 
FROM stud, course;

SELECT s.id AS student_id, s.name, c.course AS enrolled_course
FROM stud s
LEFT JOIN course c ON s.id = c.id;

SELECT s.name AS student_name, c.course AS course_name
FROM stud s
FULL JOIN course c ON s.id = c.id;

SELECT id 
FROM course 
WHERE id NOT IN (SELECT id FROM stud);
