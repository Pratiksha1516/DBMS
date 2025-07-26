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

SELECT AVG(marks) AS average_marks
FROM student2;

SELECT grade, COUNT(*) AS count_of_students
FROM student2
GROUP BY grade;

SELECT SUM(marks) AS total_marks_mumbai
FROM student2
WHERE city = 'Mumbai';

SELECT *
FROM student2
WHERE name LIKE '%a';

SELECT *
FROM student2
WHERE marks % 5 = 0;

SELECT rollno, name
FROM student2
WHERE grade IN ('A', 'B');

ALTER TABLE student2
RENAME COLUMN grade TO performance;

ALTER TABLE student2
ADD email VARCHAR(50);


--
SELECT * 
FROM student2 
WHERE marks = (SELECT MAX(marks) FROM student2);

SELECT * 
FROM student2 
WHERE marks = (SELECT MIN(marks) FROM student2);

SELECT city, COUNT(*) AS total_students 
FROM student2 
GROUP BY city;

SELECT * 
FROM student2 
WHERE name LIKE 'd%';

SELECT * 
FROM student2 
ORDER BY name DESC;

SELECT city, SUM(marks) AS total_marks, AVG(marks) AS avg_marks
FROM student2
GROUP BY city;

SELECT * 
FROM student2 
WHERE LENGTH(name) = 6;

UPDATE student2 
SET email = 'anil123@gmail.com' 
WHERE name = 'anil';

UPDATE student2 
SET city = 'Pune' 
WHERE city = 'pune';

DELETE FROM student2 
WHERE marks < 50;

SELECT COUNT(*) AS students_with_email 
FROM student2 
WHERE email IS NOT NULL;

SELECT * 
FROM student2 
WHERE email IS NULL;
