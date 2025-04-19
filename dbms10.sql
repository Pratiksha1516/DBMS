CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, Name, Age, Department, Salary)
VALUES (1, 'Alice', 30, 'HR', 50000.00),
       (2, 'Bob', 25, 'IT', 60000.00),
       (3, 'Charlie', 28, 'Finance', 70000.00);

SELECT * FROM Employees;

SELECT *
FROM Employees
WHERE Name = 'Bob' OR Department = 'IT';

SELECT *
FROM Employees
WHERE Slary BETWEEN 50000  AND 80000;

UPDATE Employees
SET Salary = 75000.00
WHERE EmployeeID = 3;

DELETE FROM Employees
WHERE EmployeeID = 1;

INSERT INTO Employees (EmployeeID, Name, Age, Department, Salary)
VALUES (1, 'Alice', 30, 'HR', 50000.00),
       (2, 'Bob', 25, 'IT', 60000.00),
       (3, 'Charlie', 28, 'Finance', 70000.00);

SELECT * FROM Employees;

UPDATE Employees
SET Salary = 75000.00
WHERE EmployeeID = 3;

DELETE FROM Employees
WHERE EmployeeID = 1;


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (1, 'HR');
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES  (2, 'IT'); 
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES  (3, 'Finance');

SELECT E.Name, D.DepartmentName
FROM Employees E
JOIN Departments D
ON E.Department = D.DepartmentName;

SELECT Department, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department;

SELECT Name 
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

SELECT Name,
       CASE 
           WHEN Salary > 60000 THEN 'High'
           WHEN Salary BETWEEN 40000 AND 60000 THEN 'Medium'
           ELSE 'Low'
       END AS SalaryCategory
FROM Employees;

CREATE VIEW IT_Department AS
SELECT Name, Age, Salary
FROM Employees
WHERE Department = 'IT';



