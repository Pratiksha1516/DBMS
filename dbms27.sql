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
(104, 'dhruv', 96, 'A', 'Sangli');

SELECT name, marks 
FROM student2;

SELECT * FROM student2;

SELECT * FROM student2 LIMIT(2);

SELECT DISTINCT city 
FROM student2;

SELECT * 
FROM student2 
WHERE marks > 80;

SELECT *
FROM student2
WHERE marks+10 > 100;

--Aggregatiion functions
SELECT MAX(marks)
FROM student2;

SELECT MIN(marks)
FROM student2;

SELECT AVG(marks)
FROM student2;

SELECT SUM(marks)
FROM student2;
