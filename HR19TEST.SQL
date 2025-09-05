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

--
SELECT S.Roll_Number, S.Name, F.Gender
FROM StudentInformation S
JOIN FacultyInformation F ON S.Adviser = F.FacultyID;

SELECT S.Name AS Student, F.FacultyID, F.Gender
FROM StudentInformation S
JOIN FacultyInformation F ON S.Adviser = F.FacultyID
WHERE F.Gender = 'Female';

SELECT F.FacultyID, F.Salary, S.Name
FROM FacultyInformation F
JOIN StudentInformation S ON F.FacultyID = S.Adviser
WHERE F.Salary > 20000;

SELECT S.Roll_Number, S.Name
FROM StudentInformation S
JOIN FacultyInformation F ON S.Adviser = F.FacultyID
WHERE F.Salary < 20000;

SELECT Gender, COUNT(*) AS AdviserCount
FROM FacultyInformation
GROUP BY Gender;

SELECT AVG(Salary) AS AvgSalary
FROM FacultyInformation;

SELECT S.Name AS Student, F.FacultyID, F.Salary
FROM StudentInformation S
JOIN FacultyInformation F ON S.Adviser = F.FacultyID
WHERE F.Salary = (SELECT MAX(Salary) FROM FacultyInformation);

SELECT S.Name, F.FacultyID, F.Salary
FROM StudentInformation S
JOIN FacultyInformation F ON S.Adviser = F.FacultyID
WHERE F.Salary = (SELECT MIN(Salary) FROM FacultyInformation);

SELECT F.FacultyID, F.Gender, F.Salary
FROM FacultyInformation F
LEFT JOIN StudentInformation S ON F.FacultyID = S.Adviser
WHERE S.Adviser IS NULL;

SELECT F.FacultyID, COUNT(S.Roll_Number) AS StudentCount
FROM FacultyInformation F
LEFT JOIN StudentInformation S ON F.FacultyID = S.Adviser
GROUP BY F.FacultyID;

SELECT S.Name
FROM StudentInformation S
JOIN FacultyInformation F ON S.Adviser = F.FacultyID
WHERE F.Gender = 'Male';

SELECT S.Name
FROM StudentInformation S
JOIN FacultyInformation F ON S.Adviser = F.FacultyID
WHERE F.Gender = 'Female';

SELECT * 
FROM FacultyInformation
ORDER BY Salary DESC;

SELECT S.Name AS Student, F.Salary
FROM StudentInformation S
JOIN FacultyInformation F ON S.Adviser = F.FacultyID;

SELECT FacultyID, Salary
FROM FacultyInformation
WHERE Salary > (SELECT AVG(Salary) FROM FacultyInformation);

SELECT S.Name, F.Salary
FROM StudentInformation S
JOIN FacultyInformation F ON S.Adviser = F.FacultyID
WHERE F.Salary BETWEEN 15000 AND 25000;
