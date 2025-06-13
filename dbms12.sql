CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(30),
    Salary DECIMAL(10, 2)
);

ALTER TABLE Employees ADD JoiningDate DATE;

INSERT INTO Employees (EmpID, Name, Age, Department, Salary, JoiningDate)
VALUES (1, 'pratiksha', 30, 'HR', 50000, to_date('2023-01-10', 'yyyy-mm-dd'));

INSERT INTO Employees (EmpID, Name, Age, Department, Salary, JoiningDate)
VALUES (2, 'ran', 28, 'Finance', 60000, to_date('2022-05-15', 'yyyy-mm-dd'));

INSERT INTO Employees (EmpID, Name, Age, Department, Salary, JoiningDate)
VALUES (3, 'prati', 35, 'IT', 70000, to_date('2020-12-20', 'yyyy-mm-dd'));

SELECT COUNT(*) FROM Employees;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(30)
);



-- Inserting data into Departments
INSERT INTO Departments (DeptID, DeptName)
VALUES (1, 'HR');
INSERT INTO Departments (DeptID, DeptName)
VALUES (2, 'Finance'); 
INSERT INTO Departments (DeptID, DeptName)
VALUES (3, 'IT');

-- INNER JOIN Example
SELECT E.Name, D.DeptName 
FROM Employees E
INNER JOIN Departments D ON E.Department = D.DeptName;

-- LEFT JOIN Example
SELECT E.Name, D.DeptName 
FROM Employees E
LEFT JOIN Departments D ON E.Department = D.DeptName;

SELECT Salary 
FROM Employees
WHERE Age > 33;

--aggregate functions
SELECT MIN(Salary)
FROM Employees;

SELECT AVG(Salary)
FROM Employees;

DROP TABLE Employees;

--
SELECT * FROM Employees
WHERE Salary > 55000;

SELECT * FROM Employees
WHERE JoiningDate > TO_DATE('2021-12-31', 'YYYY-MM-DD');

SELECT Department, COUNT(*) AS NumEmployees
FROM Employees
GROUP BY Department;

SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department;
SELECT * FROM Employees
WHERE Age = (SELECT MAX(Age) FROM Employees);

SELECT * FROM Employees
WHERE Salary BETWEEN 55000 AND 70000;

SELECT Name FROM Employees
ORDER BY Name ASC;

SELECT D.DeptName 
FROM Departments D
LEFT JOIN Employees E ON D.DeptName = E.Department
WHERE E.EmpID IS NULL;

SELECT AVG(Age) AS AverageAge
FROM Employees;

SELECT * FROM Employees
WHERE EXTRACT(YEAR FROM JoiningDate) = 2023;

SELECT * FROM Employees
WHERE Department <> 'IT';

SELECT DISTINCT Department
FROM Employees;
