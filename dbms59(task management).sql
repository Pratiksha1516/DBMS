CREATE TABLE TeamMember (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(50),
    Role VARCHAR(30)
);

CREATE TABLE Project (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100)
);

CREATE TABLE Task (
    TaskID INT PRIMARY KEY,
    TaskName VARCHAR(100),
    ProjectID INT,
    AssignedTo INT,  -- Foreign key to TeamMember
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
    FOREIGN KEY (AssignedTo) REFERENCES TeamMember(MemberID)
);

INSERT INTO TeamMember VALUES
(1, 'Pratiksha', 'Developer'),
(2, 'Ranveer', 'Tester'),
(3, 'shree', 'UI/UX Designer'),
(4, 'tanu', 'Project Manager');

INSERT INTO Project VALUES
(101, 'Cafe Management System'),
(102, 'E-Commerce App');

INSERT INTO Task VALUES
(201, 'Design UI', 101, 3),
(202, 'Backend API Development', 101, 1),
(203, 'Testing Module', 101, 2),
(204, 'Admin Dashboard', 102, 1),
(205, 'Project Planning', 102, 4),
(206, 'Create Reports', 102, NULL); 

SELECT * FROM TeamMember;

SELECT * FROM Project;

SELECT * FROM Task;

SELECT Name FROM TeamMember;

SELECT TaskName FROM Task;

SELECT ProjectName FROM Project;

SELECT Role FROM TeamMember 
WHERE Name = 'Pratiksha';

SELECT TaskName FROM Task
WHERE AssignedTo = 1;

SELECT TaskName FROM Task 
WHERE ProjectID = 101;

SELECT TaskName FROM Task 
WHERE AssignedTo IS NULL;

SELECT TaskName FROM Task 
WHERE AssignedTo = (SELECT MemberID FROM TeamMember WHERE Name = 'shree');

SELECT COUNT(*) FROM TeamMember;

SELECT COUNT(*) FROM Task;

SELECT T.TaskName, TM.Name AS AssignedTo
FROM Task T
JOIN TeamMember TM ON T.AssignedTo = TM.MemberID;

SELECT TaskName
FROM Task
WHERE AssignedTo IS NULL;

SELECT T.TaskName
FROM Task T
JOIN TeamMember TM ON T.AssignedTo = TM.MemberID
WHERE TM.Name = 'Pratiksha';

SELECT T.TaskName
FROM Task T
JOIN Project P ON T.ProjectID = P.ProjectID
WHERE P.ProjectName = 'Cafe Management System';

SELECT DISTINCT P.ProjectName
FROM Project P
JOIN Task T ON P.ProjectID = T.ProjectID
WHERE T.AssignedTo IS NULL;

SELECT COUNT(*) AS UnassignedTaskCount
FROM Task
WHERE AssignedTo IS NULL;

SELECT Name, Role 
FROM TeamMember 
ORDER BY Name;

SELECT T.TaskName, P.ProjectName
FROM Task T
JOIN Project P ON T.ProjectID = P.ProjectID;

