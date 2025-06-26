CREATE TABLE Company (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES Company(company_id)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    age INT,
    salary DECIMAL(10, 2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Works_On (
    emp_id INT,
    project_id INT,
    hours_worked INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id)
);


INSERT INTO Company VALUES
(1, 'TechCorp', 'New York'),
(2, 'SoftSolutions', 'San Francisco');

INSERT INTO Department VALUES
(101, 'IT', 1),
(102, 'HR', 1),
(103, 'Development', 2),
(104, 'Support', 2);

INSERT INTO Employee VALUES
(1001, 'Alice', 30, 60000, 101),
(1002, 'Bob', 25, 50000, 102),
(1003, 'Charlie', 35, 70000, 103),
(1004, 'Diana', 28, 48000, 104),
(1005, 'Eve', 40, 80000, 101);

INSERT INTO Project VALUES
(201, 'Website Redesign', 101),
(202, 'App Development', 103),
(203, 'Recruitment Drive', 102),
(204, 'Customer Support Tool', 104);

INSERT INTO Works_On VALUES
(1001, 201, 20),
(1002, 203, 15),
(1003, 202, 25),
(1004, 204, 10),
(1005, 201, 30);

--
SELECT * FROM Employee;

SELECT * FROM Project;

SELECT D.dept_name
FROM Department D
JOIN Company C ON D.company_id = C.company_id
WHERE C.company_name = 'TechCorp';

SELECT emp_name FROM Employee
WHERE dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'HR');

SELECT E.emp_name, W.hours_worked
FROM Employee E
JOIN Works_On W ON E.emp_id = W.emp_id
WHERE W.hours_worked > 15;

SELECT company_name FROM Company 
WHERE location = 'San Francisco';

SELECT emp_name
FROM Employee E
JOIN Works_On W ON E.emp_id = W.emp_id
JOIN Project P ON W.project_id = P.project_id
WHERE P.project_name = 'App Development';

SELECT dept_id, COUNT(*) AS total_employees
FROM Employee
GROUP BY dept_id;

SELECT emp_name, salary FROM Employee 
WHERE salary > 60000;

SELECT AVG(salary)
FROM Employee
WHERE dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'IT');

SELECT D.dept_name, COUNT(P.project_id) AS total_projects
FROM Department D
LEFT JOIN Project P ON D.dept_id = P.dept_id
GROUP BY D.dept_name;

SELECT emp_id
FROM Works_On
GROUP BY emp_id
HAVING COUNT(project_id) > 1;
