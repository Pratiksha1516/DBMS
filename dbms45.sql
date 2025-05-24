CREATE TABLE IF NOT EXISTS student(
rollno INT PRIMARY KEY,
name VARCHAR(40),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101, 'anil', 78, 'C', 'pune'),
(102, 'bhumika', 93, 'A', 'Mumbai'),
(103, 'chetan', 85, 'B', 'Mumbai'),
(104, 'dhruv', 96, 'A', 'Delhi'),
(105, 'emanuel', 92, 'B', 'Delhi'),
(106, 'farah', 82, 'B', 'Delhi');

select * from student;

SELECT COUNT(rollno)
FROM student;

SELECT MAX(marks)
FROM student;

SELECT MIN(marks)
FROM student;

SELECT SUM(marks)
FROM student;

--views
CREATE VIEW view1 AS
SELECT rollno, name, marks FROM student;

SELECT * FROM view1;

SELECT *
FROM view1
WHERE marks > 90;

DROP VIEW view1;
