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
