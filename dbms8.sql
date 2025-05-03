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

select S.name
from student s
join Enrollment E on S.studentID = E.studentID
where E.courseID = 101;

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
