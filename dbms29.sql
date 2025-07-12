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
SELECT *
FROM student2 
WHERE marks > 85;

SELECT * 
FROM student2 
WHERE city = 'Mumbai';

SELECT * 
FROM student2
WHERE grade = 'B';

SELECT * 
FROM student2 
ORDER BY marks DESC;

SELECT name, grade 
FROM student2 
WHERE marks < 90;

SELECT SUM(marks) AS total_marks 
FROM student2;

SELECT grade, COUNT(*) FROM student2 
GROUP BY grade;

SELECT city, MIN(marks) AS min_marks
FROM student2 
GROUP BY city;

SELECT city, COUNT(*) 
FROM student2 
GROUP BY city HAVING COUNT(*) > 1;

SELECT grade, AVG(marks)
FROM student2 
GROUP BY grade;

SELECT * 
FROM student2 
WHERE marks = (SELECT MAX(marks) FROM student2);

SELECT *
FROM student2 
WHERE marks > (SELECT AVG(marks) FROM student2);

SELECT * 
FROM student2 
WHERE city <> 'Mumbai';

SELECT * 
FROM student2 
WHERE name LIKE 'b%';

SELECT * 
FROM student2
WHERE name LIKE '%n';

SELECT * 
FROM student2 
WHERE grade IN ('A', 'B');

SELECT *
FROM student2 
WHERE city IN ('Delhi', 'Pune');

SELECT * 
FROM student2 
WHERE city NOT IN ('Sangli', 'Delhi');

SELECT * 
FROM student2 
WHERE marks BETWEEN 80 AND 90;
