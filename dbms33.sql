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

SELECT MAX(marks)
FROM student2;

SELECT MIN(marks)
FROM student2;

SELECT SUM(marks)
FROM student2;

UPDATE student2
SET marks = 12
WHERE rollno = 105;

DELETE FROM student2
WHERE marks < 33;

SELECT * FROM student2
ORDER BY rollno;

