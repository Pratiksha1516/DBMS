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

--
SELECT name, city 
FROM student2
WHERE city = 'Mumbai';

SELECT *
FROM student2 
WHERE grade = 'A';

SELECT * 
FROM student2 
WHERE marks BETWEEN 80 AND 90;

SELECT * 
FROM student2 
WHERE city IN ('Pune', 'Delhi');

SELECT * 
FROM student2
WHERE name LIKE 'c%';

SELECT * 
FROM student2 
ORDER BY marks DESC;

SELECT name, city 
FROM student2
ORDER BY city ASC, name DESC;

SELECT *
FROM student2 
ORDER BY grade;

SELECT COUNT(*) AS total_students 
FROM student2;

SELECT MAX(marks) AS highest_marks 
FROM student2;

SELECT MIN(marks) AS lowest_marks 
FROM student2;

SELECT AVG(marks) AS average_marks 
FROM student2;

SELECT SUM(marks) AS total_marks 
FROM student2;

SELECT grade, COUNT(*) AS students_per_grade 
FROM student2 
GROUP BY grade;

SELECT city, AVG(marks) AS avg_marks 
FROM student2
GROUP BY city;

SELECT grade, MAX(marks) AS top_score
FROM student2
GROUP BY grade;

SELECT name, marks,
CASE
WHEN marks >= 90 THEN 'Excellent'
WHEN marks >= 80 THEN 'Good'
ELSE 'Average'
END AS performance
FROM student2;
