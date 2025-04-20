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

SELECT * FROM student2
ORDER BY rollno;

CREATE TABLE  IF NOT EXISTS dept(
id INT PRIMARY KEY,
name VARCHAR(20)
);

CREATE TABLE teacher(	-- foreign key concept
id INT PRIMARY KEY,
name VARCHAR(20),
dept_id INT,
FOREIGN KEY(dept_id) REFERENCES dept(id)

INSERT INTO dept
(id, name)
VALUES
(101, 'Science'),
(102, 'English'),
(103, 'Hindi');

INSERT INTO teacher
(id, name, dept_id)
VALUES
(101, 'Adum', 101),
(102, 'Bob', 103),
(103, 'Casey', 102),
(104, 'David', 102);

SELECT * FROM dept;

SELECT * FROM teacher;

SELECT name, COUNT(id)
FROM dept
GROUP BY name;

SELECT dept_id, COUNT(id)
FROM teacher
GROUP BY dept_id;

SELECT name
FROM teacher
WHERE dept_id = 102;

SELECT name
FROM dept
WHERE id = 102;

truncate table teacher;