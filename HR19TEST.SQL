CREATE TABLE StudentInformation (
    Roll_Number INT PRIMARY KEY,
    Name VARCHAR(50),
    Adviser INT
);

CREATE TABLE FacultyInformation (
    FacultyID INT PRIMARY KEY,
    Gender VARCHAR(10),
    Salary INT
);

INSERT INTO StudentInformation (Roll_Number, Name, Adviser)
VALUES 
(101, 'John', 1),
(102, 'Alice', 2),
(103, 'Bob', 3),
(104, 'Eva', 4);

INSERT INTO FacultyInformation (FacultyID, Gender, Salary)
VALUES 
(1, 'Male', 18000),
(2, 'Female', 25000),
(3, 'Male', 12000),
(4, 'Female', 22000);

SELECT * FROM StudentInformation;

SELECT * FROM FacultyInformation;

SELECT
	S. Roll_Number,
	S.Name,
	S.Adviser
FROM
	StudentInformation S
JOIN 
	FacultyInformation F
ON 
	S.Adviser = F.FacultyID
WHERE
	(F.Gender = 'Male' AND F.Salary > 15000)OR
	(F.Gender = 'Female' AND F.Salary > 20000);

SELECT Gender
FROM FacultyInformation
WHERE Salary < 20000;

SELECT *
FROM FacultyInformation
WHERE Salary > 20000;

--Aggegation function
SELECT COUNT(Name)
FROM StudentInformation;

SELECT COUNT(FacultyID)
FROM FacultyInformation;

SELECT MAX(Salary)
FROM FacultyInformation;

SELECT MIN(Salary)
FROM FacultyInformation;

SELECT SUM(Salary)
FROM FacultyInformation;

SELECT AVG(Salary)
FROM FacultyInformation;

SELECT SUM(Salary)
FROM FacultyInformation
WHERE Gender = 'Male'; 

SELECT SUM(Salary)
FROM FacultyInformation
WHERE Gender = 'Female'; 
