CREATE DATABASE college1;

CREATE TABLE IF NOT EXISTS student2(
rollno INT PRIMARY KEY,
name VARCHAR(40),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student2
(rollno, name, marks, grade, city)
VALUES
(101, 'anil', 78, 'C', 'pune'),
(102, 'bhumika', 93, 'A', 'Mumbai'),
(103, 'chetan', 85, 'B', 'Delhi'),
(104, 'dhruv', 96, 'A', 'Sangli'),
(105, 'ram', 85, 'B', 'Mumbai');

SELECT * FROM student2;

SELECT name, marks
FROM student2
WHERE marks > 90;

SELECT name, grade
FROM student2;

SELECT name, marks,grade
FROM student2
WHERE marks < 90;

SELECT *
FROM student2
WHERE name LIKE 'c%';

SELECT name, city
FROM student2
WHERE city LIKE '%i';

SELECT  distinct city
FROM student2
WHERE city like '_u%';

SELECT grade, COUNT(rollno)
FROM student2
GROUP BY grade
ORDER BY grade;

SELECT city, COUNT(rollno)
FROM student2
WHERE marks > 90
GROUP BY city;

SELECT city
FROM student2
WHERE grade = 'A'
GROUP BY city
HAVING MAX(marks) >= 93
ORDER BY city DESC;

SELECT MAX(marks)
FROM student2;

SELECT MIN(marks)
FROM student2;

SELECT AVG(marks)
FROM student2;
