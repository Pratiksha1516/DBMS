CREATE TABLE student3(  		-- some practice questions are there bellow
id INT PRIMARY KEY,
name VARCHAR(20),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student4
(stud_id, fullname, marks, grade, city)
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

TRUNCATE TABLE student4;

ALTER TABLE student4
RENAME COLUMN name TO fullname;

DELETE FROM student4
WHERE marks < 80;

ALTER TABLE student4
DROP COLUMN grade;

SELECT MAX(marks)
FROM student4;

SELECT COUNT(marks)
FROM student4;
