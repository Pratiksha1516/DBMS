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

--
SELECT * FROM student2 
WHERE name LIKE '%n';

SELECT * FROM student2 
WHERE name LIKE '_h%';

SELECT * FROM student2 
WHERE LENGTH(name) > 5;

SELECT * FROM student2 
WHERE LOWER(city) LIKE '%a%';

SELECT COUNT(DISTINCT city) AS unique_cities 
FROM student2;

SELECT * FROM student2 
WHERE city NOT IN ('Mumbai', 'pune');

SELECT name FROM student2 
ORDER BY name DESC;

SELECT * FROM student2 
WHERE marks = (SELECT MIN(marks) FROM student2);

SELECT * FROM student2 
WHERE LOWER(name) LIKE '%m%';

UPDATE student2 SET marks = marks + 5 
WHERE city = 'Delhi';

SELECT * FROM student2 
WHERE rollno % 2 = 0;

SELECT * FROM student2
WHERE rollno != 104;

SELECT city, MAX(marks) AS max_marks FROM student2
GROUP BY city;

SELECT LOWER(name) AS lowercase_name 
FROM student2;

SELECT * FROM student2 
WHERE grade IN ('O', 'B');

SELECT name, marks, marks * 1.1 AS marks_with_bonus 
FROM student2;

SELECT name, marks,
       RANK() OVER (ORDER BY marks DESC) AS rank
FROM student2;

SELECT * FROM student2
WHERE marks IN (
    SELECT marks FROM student2 GROUP BY marks HAVING COUNT(*) > 1
);

SELECT grade, COUNT(*) AS total FROM student2
GROUP BY grade;

SELECT name || ' from ' || city AS student_info 
FROM student2;
