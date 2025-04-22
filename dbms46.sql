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

--SUB QUERIES under FROM
SELECT * FROM student;

SELECT *
FROM student
WHERE city = 'Delhi';

SELECT MAX(marks)
FROM(SELECT * FROM student WHERE city = 'Delhi') AS temp;
