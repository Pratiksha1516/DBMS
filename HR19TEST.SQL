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

SELECT *
FROM StudentInformation
WHERE Name LIKE '_o%';

SELECT *
FROM StudentInformation
WHERE Adviser > 2;

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


--
SELECT S.*
FROM StudentInformation S
JOIN FacultyInformation F ON S.Adviser = F.FacultyID
WHERE F.Gender = 'Female';

SELECT S.*
FROM StudentInformation S
JOIN FacultyInformation F ON S.Adviser = F.FacultyID
WHERE F.Salary = (SELECT MIN(Salary) FROM FacultyInformation);

SELECT F.FacultyID, F.Gender, S.Roll_Number
FROM FacultyInformation F
JOIN StudentInformation S ON F.FacultyID = S.Adviser
WHERE F.Gender = 'Female';


SELECT * FROM FacultyInformation
ORDER BY Salary DESC;

SELECT * FROM FacultyInformation
ORDER BY Salary DESC
LIMIT 2;

SELECT * FROM StudentInformation
ORDER BY Name ASC;

SELECT UPPER(Name) AS Uppercase_Name
FROM StudentInformation;

SELECT Name, LENGTH(Name) AS Name_Length
FROM StudentInformation;

SELECT CONCAT(Name, ' - ', Roll_Number) AS Info
FROM StudentInformation;

SELECT Gender, SUM(Salary) AS Total_Salary
FROM FacultyInformation
GROUP BY Gender;

SELECT Adviser, COUNT(*) AS Student_Count
FROM StudentInformation
GROUP BY Adviser;

SELECT S.*
FROM StudentInformation S
JOIN FacultyInformation F ON S.Adviser = F.FacultyID
WHERE F.Salary > (SELECT AVG(Salary) FROM FacultyInformation);

SELECT *
FROM FacultyInformation
WHERE FacultyID NOT IN (SELECT Adviser FROM StudentInformation);

SELECT FacultyID
FROM FacultyInformation
EXCEPT
SELECT Adviser
FROM StudentInformation;
