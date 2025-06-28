CREATE TABLE student3(
id INT PRIMARY KEY,
name VARCHAR(20),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student3
(id, name, marks, grade, city)
VALUES
(101, 'anil', 78, 'C', 'pune'),
(102, 'bhumika', 93, 'A', 'Mumbai'),
(103, 'chetan', 85, 'B', 'Mumbai'),
(104, 'dhruv', 96, 'A', 'Delhi'),
(105, 'ram', 12, 'F', 'Delhi'),
(106, 'farah', 82, 'B', 'Delhi');

SELECT * FROM student3;

ALTER TABLE student3
ADD COLUMN age INT;

ALTER TABLE student3
DROP COLUMN age;

ALTER TABLE student3
RENAME TO student4;

SELECT * FROM student4;

ALTER TABLE student4
RENAME COLUMN id TO stud_id;

ALTER TABLE student4
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE student4
ALTER COLUMN stud_age1 TYPE VARCHAR(2); 

INSERT INTO student4
(stud_id, name, marks, stud_age1)
VALUES
(107,'gargi', 68, 100);

ALTER TABLE student4
ALTER COLUMN stud_age1 TYPE INTEGER
USING stud_age1::INTEGER;

ALTER TABLE student4
DROP COLUMN stud_age1;

ALTER TABLE student4
RENAME TO stu;

SELECT * FROM stu;

ALTER TABLE stu
RENAME TO student4;

SELECT * FROM student4;

SELECT name, marks
FROM student4
WHERE name LIKE '_a%';

SELECT name, city
FROM student4
WHERE city LIKE '_u%';

SELECT distinct city, name
FROM student4
WHERE name LIKE '__r%';

--Aggregate 
SELECT COUNT(stud_id)
FROM student4;

SELECT MAX(marks)
FROM student4;

SElECT AVG(marks)
FROM student4;

SELECT MIN(marks)
FROM student4;

SELECT SUM(marks)
FROM student4;

--
SELECT * FROM student4
WHERE grade = 'A';

SELECT * FROM student4
WHERE marks > 80;

SELECT * FROM student4
WHERE marks BETWEEN 70 AND 90;

SELECT * FROM student4
WHERE city IN ('Delhi', 'Mumbai');

SELECT * FROM student4
WHERE name LIKE '%a';

SELECT * FROM student4
ORDER BY marks DESC;

SELECT * FROM student4
ORDER BY marks DESC
LIMIT 3;

SELECT * FROM student4
WHERE marks < 35;

SELECT city, COUNT(*) AS student_count
FROM student4
GROUP BY city;

SELECT city, AVG(marks) AS average_marks
FROM student4
GROUP BY city;

SELECT grade, COUNT(*) AS count
FROM student4
GROUP BY grade;

SELECT * FROM student4
WHERE name LIKE '_h%';

SELECT * FROM student4
WHERE city LIKE 'D%';

SELECT * FROM student4
WHERE marks NOT BETWEEN 70 AND 90;
