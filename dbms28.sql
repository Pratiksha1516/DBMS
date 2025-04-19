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

SELECT name, marks FROM student2;

SELECT * FROM student2;

SELECT DISTINCT city FROM student2;

SELECT * 
FROM student2 
WHERE marks > 80;

SELECT *
FROM student2
WHERE marks+10 > 100;

SELECT *
FROM student2
WHERE marks > 90 AND city = 'Mumbai';

SELECT *
FROM student2
WHERE marks > 90 OR city = 'Mumbai';

SELECT *
FROM student2
WHERE marks BETWEEN 70 AND 90;

SELECT *
FROM student2
WHERE city IN ('Delhi', 'Belagav', 'Mumbai');

SELECT *
FROM student2
WHERE city NOT IN ('Delhi');

SELECT *
FROM student2
WHERE marks > 80
LIMIT 2;

SELECT * 
FROM student2
ORDER BY city ASC;

SELECT * 
FROM student2
ORDER BY marks ASC;

SELECT * 
FROM student2
ORDER BY marks DESC
LIMIT 3;

INSERT INTO student2 VALUES (105, 'ram', 85, 'B', 'Mumbai');