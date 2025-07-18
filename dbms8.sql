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

SELECT * FFROM Student;

SELECT * FROM Course;

SELECT * FROM Enrollment;

SELECT Name FROM Student;

SELECT CourseName, Credits FROM Course;

SELECT Name, Department FROM Student WHERE Age > 20;

SELECT StudentID, Grade FROM Enrollment;

SELECT CourseID, Semester FROM Enrollment;

SELECT DISTINCT Semester 
FROM Enrollment;

SELECT Name 
FROM Student 
WHERE Name LIKE 'r%';

select S.name
from student s
join Enrollment E on S.studentID = E.studentID
where E.courseID = 101;

SELECT CourseName, Credits 
FROM Course 
WHERE CourseID = 102;
select C.CourseName
from Course C
join Enrollment E on C.CourseID = E.CourseID
where E.StudentID = 1;

select S.Name
from student S
join Enrollment E on S.studentID = E.studentID
where E.Grade = 'A';

select Age 
from Student
where StudentID = 2;

select S.name
from student s
join Enrollment E on S.studentID = E.studentID
where E.courseID = 102;

select Grade
from Enrollment
where EnrollmentID = 2;

--
SELECT S.Name, C.CourseName
FROM Student S
JOIN Enrollment E ON S.StudentID = E.StudentID
JOIN Course C ON E.CourseID = C.CourseID;

SELECT S.Name
FROM Student S
LEFT JOIN Enrollment E ON S.StudentID = E.StudentID
WHERE E.StudentID IS NULL;

SELECT C.CourseName, COUNT(E.StudentID) AS StudentCount
FROM Course C
LEFT JOIN Enrollment E ON C.CourseID = E.CourseID
GROUP BY C.CourseName;

SELECT Department, AVG(Age) AS AverageAge
FROM Student
GROUP BY Department;

SELECT S.Name, SUM(C.Credits) AS TotalCredits
FROM Student S
JOIN Enrollment E ON S.StudentID = E.StudentID
JOIN Course C ON E.CourseID = C.CourseID
WHERE S.StudentID = 1
GROUP BY S.Name;

SELECT DISTINCT C.CourseName
FROM Course C
JOIN Enrollment E ON C.CourseID = E.CourseID
WHERE E.Semester = 'Fall 2024';

SELECT S.Name, MAX(E.Grade) AS HighestGrade
FROM Student S
JOIN Enrollment E ON S.StudentID = E.StudentID
GROUP BY S.Name;

SELECT S.Name, COUNT(E.CourseID) AS CourseCount
FROM Student S
JOIN Enrollment E ON S.StudentID = E.StudentID
GROUP BY S.Name
HAVING COUNT(E.CourseID) > 1;

SELECT S.Name, C.CourseName, E.Grade
FROM Student S
JOIN Enrollment E ON S.StudentID = E.StudentID
JOIN Course C ON E.CourseID = C.CourseID;

SELECT C.CourseName
FROM Course C
LEFT JOIN Enrollment E ON C.CourseID = E.CourseID
WHERE E.CourseID IS NULL;

