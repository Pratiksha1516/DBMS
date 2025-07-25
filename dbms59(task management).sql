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

