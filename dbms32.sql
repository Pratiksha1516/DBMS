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

-- UPDATE queries on EXISTING TABLE
UPDATE student2
SET grade = 'O'
WHERE grade =  'A';

UPDATE student2
SET marks = 82
WHERE rollno = 105;

UPDATE student2
SET grade = 'B' 
WHERE marks BETWEEN 80 AND 90;

UPDATE student2
SET marks = marks+1;

SELECT * FROM student2;

--
SELECT * FROM student2 
WHERE city = 'Mumbai';

SELECT name, marks FROM student2 
WHERE marks > 80;

SELECT * FROM student2
WHERE name LIKE 'a%';

SELECT * FROM student2
WHERE marks BETWEEN 80 AND 90;

SELECT * FROM student2
WHERE city != 'pune';

SELECT AVG(marks) AS average_marks 
FROM student2;

SELECT MAX(marks) AS highest_marks 
FROM student2;

SELECT COUNT(*) AS total_students
FROM student2;

SELECT COUNT(*) AS grade_B_students 
FROM student2 
WHERE grade = 'B';

SELECT SUM(marks) AS total_marks 
FROM student2;

SELECT * FROM student2
ORDER BY marks DESC;

SELECT * FROM student2 ORDER BY city, name;

SELECT grade, AVG(marks) AS avg_marks 
FROM student2 GROUP BY grade;

SELECT city, COUNT(*) AS students_count 
FROM student2 GROUP BY city;

SELECT grade, COUNT(*) FROM student2 
GROUP BY grade 
HAVING COUNT(*) > 1;

SELECT UPPER(name) AS name_upper
FROM student2;

SELECT SUBSTRING(name FROM 1 FOR 3) AS short_name 
FROM student2;

SELECT * FROM student2 
WHERE name LIKE '%a';
