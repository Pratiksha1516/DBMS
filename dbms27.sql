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

SELECT * FROM student2;

SELECT name, marks 
FROM student2;

SELECT * FROM student2 LIMIT(2);

SELECT DISTINCT city 
FROM student2;

SELECT * 
FROM student2 
WHERE marks > 80;

SELECT *
FROM student2
WHERE marks+10 > 100;

SELECT marks,grade
FROM student2
WHERE grade = 'A';

SELECT DISTINCT grade
FROM student2 order by grade asc;

SELECT * 
FROM student2
WHERE name like = 'a%__';

SELECT * 
FROM student2
WHERE name like '__r%__';

SELECT marks 
FROM student2
WHERE grade = 'C';

SELECT *
FROM student2
WHERE city LIKE '_____i%';

SELECT *
FROM student2
WHERE city LIKE '____i%';

SELECT *
FROM student2
WHERE name LIKE 'a%';

SELECT *
FROM student2
WHERE name LIKE '%a';

SELECT *
FROM student2
WHERE name LIKE '______';

SELECT * 
FROM student2
WHERE city IN('Mumbai', 'Pune');

SELECT * 
FROM student2
WHERE city IN('Mumbai', 'Pune');


--bitwise operations
SELECT name, marks, marks & 6 AS bitwise_and
FROM student2;

SELECT name, marks, ~marks AS bitwise_not
FROM student2;

SELECT name, marks, marks | 5 AS bitwise_or
FROM student2;

SELECT name, marks, marks # 7 AS bitwise_xor
FROM student2;

SELECT * 
FROM student2
WHERE city = 'pune' OR marks > 90;

SELECT * 
FROM student2
WHERE name like '_____n%';

--Aggregatiion functions
SELECT COUNT(name)
FROM student2;

SELECT MAX(marks)
FROM student2;

SELECT MIN(marks)
FROM student2;

SELECT AVG(marks)
FROM student2;

SELECT SUM(marks)
FROM student2;

SELECT COUNT(name)
FROM student2
WHERE grade = 'A';

SELECT COUNT(name)
FROM student2
WHERE marks < 80;

SELECT COUNT(name)
FROM student2
WHERE marks > 80 and marks < 95; 
--or
SELECT COUNT(name)
FROM student2
WHERE marks between 80 and 95;


--update queries
UPDATE student2
SET marks = 87
WHERE rollno = 101;

UPDATE student2
SET city = 'Hupri'
WHERE name= 'dhruv';

UPDATE student2
SET grade = 'A'
WHERE marks > 90;

--alter
ALTER TABLE student2
ADD result varchar(10);

UPDATE student2
SET marks = 22
WHERE rollno = 103;

UPDATE student2
SET result = case
	WHEN marks > 33 THEN 'pass'
	ELSE 'fail'
END;
