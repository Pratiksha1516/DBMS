CREATE TABLE student(
    id INT PRIMARY KEY,
    name VARCHAR(55),
    major VARCHAR(50),
    department VARCHAR(50),
    gpa DECIMAL(3, 1),
    graduation_date DATE
);

INSERT INTO student 
VALUES (1, 'Pratiksha', 'Computer Science', 'Engineering', 8.5, TO_DATE('2017-05-13', 'YYYY-MM-DD'));
INSERT INTO student 
VALUES (2, 'Ran', 'Electrical Engineering', 'Engineering', 7.8, TO_DATE('2018-06-20', 'YYYY-MM-DD'));
INSERT INTO student 
VALUES (3, 'prati', 'Mathematics', 'Science', 9.2, TO_DATE('2019-05-18', 'YYYY-MM-DD'));

SELECT * FROM student;
    
SELECT * FROM student WHERE department = 'Engineering';

SELECT * FROM student WHERE name LIKE 'P%';

SELECT * FROM student ORDER BY gpa DESC;

SELECT graduation_date
FROM student
WHERE name = 'prati';

drop table student
