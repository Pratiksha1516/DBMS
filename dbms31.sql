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
