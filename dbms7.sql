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

INSERT INTO Student VALUES (1, 'prati', 20, 'Computer Science');
INSERT INTO Student VALUES (2, 'ranveer', 21, 'Mathematics');

INSERT INTO Course VALUES (101, 'Database Systems', 4);
INSERT INTO Course VALUES (102, 'Linear Algebra', 3);

INSERT INTO Enrollment VALUES (1, 1, 101, 'Fall 2024', 'A');
INSERT INTO Enrollment VALUES (2, 2, 102, 'Fall 2024', 'B');

select S.name
from student s
join Enrollment E on S.studentID = E.studentID
where E.courseID = 101;

SELECT Grade
FROM Enrollment 
WHERE EnrollmentID = 2;

SELECT Age
FROM Student
WHERE StudentID = 1;
