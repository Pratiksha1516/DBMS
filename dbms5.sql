CREATE TABLE student(
    id INT PRIMARY KEY,
    name VARCHAR(55),
    major VARCHAR(50),
    department VARCHAR(50),
    gpa DECIMAL(3, 1),
    graduation_date DATE
);

INSERT INTO student 
(id, name, major, department, gpa,graduation_date)
VALUES
(1, 'Pratiksha','Computer Science', 'Engineering', 8.5, TO_DATE('2017-05-13', 'YYYY-MM-DD')),
(2, 'Ran', 'Electrical Engineering', 'Engineering', 7.8, TO_DATE('2018-06-20', 'YYYY-MM-DD')),
(3, 'prati', 'Mathematics', 'Science', 9.2, TO_DATE('2019-05-18', 'YYYY-MM-DD'));

SELECT * FROM student;

--Aggregation function
SELECT COUNT(id)
FROM student

SELECT MAX(gpa)
FROM student;

SELECT MIN(gpa)
FROM student;

SELECT SUM(gpa)
FROM student;

SELECT *
FROM student
WHERE gpa > 8 OR name = 'Pratiksha';

SELECT *
FROM student
WHERE name like '%a';

SELECT * 
FROM student
WHERE name like 'R%';

SELECT major
FROM student
WHERE department like 'E%';

SELECT *
FROM student 
WHERE gpa BETWEEN 8 TO 9.5;
    
SELECT * 
FROM student 
WHERE department = 'Engineering';

SELECT * 
FROM student 
WHERE name LIKE 'P%';

SELECT * 
FROM student 
ORDER BY gpa DESC;

SELECT graduation_date
FROM student
WHERE name = 'prati';

SELECT gpa
FROM student
WHERE name = 'Ran';

SELECT graduation_date
FROM student
WHERE id = 2; 

SELECT department
FROM student
WHERE id = 3;

--UPDATE QUERY
UPDATE student
SET name = 'Ranveer'
WHERE id = 2;

UPDATE student
SET major = 'Civil Engineer'
WHERE id = 3;

UPDATE student
SET department = 'Engineering'
WHERE id = 3;

--

SELECT * FROM student
WHERE department != 'Engineering';

SELECT * FROM student
WHERE gpa < 8;

SELECT name, gpa
FROM student
ORDER BY name ASC;

SELECT * FROM student
WHERE graduation_date > TO_DATE('2018-12-31', 'YYYY-MM-DD');

SELECT DISTINCT major
FROM student;

SELECT department, COUNT(*) AS total_students
FROM student
GROUP BY department;

SELECT * FROM student
WHERE LENGTH(name) = 6;

SELECT department, AVG(gpa) AS avg_gpa
FROM student
GROUP BY department;

SELECT department, AVG(gpa) AS avg_gpa
FROM student
GROUP BY department
HAVING AVG(gpa) > 8;

SELECT UPPER(name) AS upper_name
FROM student;

SELECT name, EXTRACT(YEAR FROM graduation_date) AS grad_year
FROM student;

UPDATE student
SET gpa = gpa + 0.2
WHERE department ='Electrical Engineering';
