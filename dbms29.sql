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


SELECT name, marks FROM student2;

SELECT * FROM student2;

SELECT MAX(marks) 
FROM student2;

SELECT AVG(marks)
FROM student2;

SELECT COUNT(name)
FROM student2;

SELECT city, COUNT(rollno)
FROM student2
GROUP BY city;

SELECT city,name, COUNT(rollno)
FROM student2
GROUP BY city, name;

SELECT city, AVG(marks)
FROM student2
GROUP BY city;

SELECT city, AVG(marks)
FROM student2
GROUP BY city
ORDER BY AVG(marks);

--
SELECT * FROM student2 
WHERE marks > 85;

SELECT * FROM student2 
WHERE city = 'Mumbai';

SELECT * FROM student2
WHERE grade = 'B';
