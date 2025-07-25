CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Semester VARCHAR(20),
    Grade VARCHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Student
(StudentID,Name,Age,Department)
VALUES 
(1, 'prati', 20, 'Computer Science'),
(2, 'ranveer', 21, 'Mathematics');

INSERT INTO Course 
(CourseID,CourseName,Credits)
VALUES
(101, 'Database Systems', 4),
(102, 'Linear Algebra', 3);

INSERT INTO Enrollment
(EnrollmentID,StudentID,CourseID,Semester,Grade)
VALUES 
(1, 1, 101, 'Fall 2024', 'A'),
(2, 2, 102, 'Fall 2024', 'B');

SELECT * FROM Student;

SELECT * FROM Course;

SELECT * FROM Enrollment;

--Aggregate 
SELECT COUNT(Name)
FROM Student;

SELECT MAX(Age)
FROM Student;

SELECT MIN(Age)
FROM Student;

SELECT MAX(Credits)
FROM Course;

SELECT MIN(Credits)
FROM Course;

SELECT MIN
(
  CASE Grade
    WHEN 'A' THEN 2
    WHEN 'B' THEN 1
  END
) AS Min_Grade_Value
FROM Enrollment;

--SELECT queries
SELECT *
FROM Student 
WHERE Age > 20 OR Department = 'Mathematics';

SELECT Grade
FROM Enrollment 
WHERE EnrollmentID = 2;

SELECT Age
FROM Student
WHERE StudentID = 1;

SELECT Semester
FROM Enrollment
WHERE EnrollmentID = 1;

--JOINS
select S.name
from student s
join Enrollment E on S.studentID = E.studentID
where E.courseID = 101;

SELECT S.Name, S.Department, E.Grade
FROM Student S
JOIN Enrollment E ON S.StudentID = E.StudentID;

SELECT S.Name, S.Department, E.Grade
FROM Student S
RIGHT JOIN Enrollment E ON S.StudentID = E.StudentID;

--UPDATE 
UPDATE Student
SET Name = 'Pratiksha'
WHERE StudentID = 1;

UPDATE Student
SET Age = 25
WHERE Name = 'ranveer';

UPDATE Course
SET Credits = 9
WHERE CourseID = 102;

UPDATE Course
SET CourseName = 'Software Engineering'
WHERE CourseID = 102;

--
SELECT * 
FROM Student 
WHERE Department = 'Computer Science';

SELECT DISTINCT S.Name 
FROM Student S
JOIN Enrollment E ON S.StudentID = E.StudentID;

SELECT CourseName 
FROM Course 
WHERE Credits > 3;

SELECT S.Name, C.CourseName
FROM Student S
JOIN Enrollment E ON S.StudentID = E.StudentID
JOIN Course C ON E.CourseID = C.CourseID;

SELECT S.Name
FROM Student S
JOIN Enrollment E ON S.StudentID = E.StudentID
WHERE E.Grade = 'A';

SELECT Department, COUNT(*) AS StudentCount
FROM Student
GROUP BY Department;

SELECT AVG(Age) AS AverageAge FROM Student;

SELECT COUNT(*)
FROM Course 
WHERE Credits > 3;

SELECT Semester, COUNT(*) AS EnrollmentCount
FROM Enrollment
GROUP BY Semester;

SELECT S.Name, SUM(C.Credits) AS TotalCredits
FROM Student S
JOIN Enrollment E ON S.StudentID = E.StudentID
JOIN Course C ON E.CourseID = C.CourseID
GROUP BY S.Name;

SELECT Name FROM Student
WHERE Age > (SELECT AVG(Age) FROM Student);

SELECT CourseName
FROM Course
WHERE CourseID IN (
  SELECT CourseID
  FROM Enrollment
  WHERE StudentID = (SELECT StudentID FROM Student WHERE Name = 'ranveer')
);

SELECT Name FROM Student
WHERE Age = (SELECT MAX(Age) FROM Student);

SELECT Name FROM Student
WHERE StudentID NOT IN (SELECT StudentID FROM Enrollment);

SELECT CourseName FROM Course
WHERE CourseID NOT IN (
  SELECT CourseID FROM Enrollment
  WHERE StudentID = (SELECT StudentID FROM Student WHERE Name = 'prati')
);

SELECT * FROM Student ORDER BY Age DESC;

SELECT * FROM Student ORDER BY Age ASC LIMIT 1;

SELECT S.Name, COUNT(*) AS Enrollments
FROM Student S
JOIN Enrollment E ON S.StudentID = E.StudentID
GROUP BY S.Name
ORDER BY Enrollments DESC
LIMIT 2;

SELECT S.Name, E.Grade,
  CASE E.Grade
    WHEN 'A' THEN 10
    WHEN 'B' THEN 8
    ELSE 0
  END AS GradePoints
FROM Student S
JOIN Enrollment E ON S.StudentID = E.StudentID;

SELECT S.Name
FROM Student S
WHERE EXISTS (
    SELECT 1 FROM Enrollment E1
    WHERE E1.StudentID = S.StudentID AND E1.Semester = 'Fall 2024'
)
AND EXISTS (
    SELECT 1 FROM Enrollment E2
    WHERE E2.StudentID = S.StudentID AND E2.Semester != 'Fall 2024'
);
