create Database college;

CREATE TABLE Student1 (
    StudentID SERIAL PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Grade VARCHAR(10)
);

INSERT INTO Student1 (Name, Age, Grade) VALUES
('prati', 20, 'A'),
('ranveer', 22, 'B'),
('shiriguri', 21, 'A'),
('varsha', 23, 'C');

SELECT * FROM Student1;

SELECT Name, Age 
FROM Student1
WHERE Age > 21;

SELECT Grade, COUNT(*) 
FROM Student1 GROUP BY Grade;

UPDATE Student1 
SET Grade = 'B+' 
WHERE Name = 'ranveer';

DELETE FROM Student1 
WHERE Name = 'varsha';

SELECT Grade
FROM Student1
WHERE StudentID = 3;

SELECT Age
FROM Student1
WHERE Name = 'ranveer';

SELECT Grade
FROM Student1
WHERE Age < 22;

SELECT Name
FROM Student1
WHERE Age < 21;

SELECT Name
FROM Student1
WHERE Grade = 'A';
