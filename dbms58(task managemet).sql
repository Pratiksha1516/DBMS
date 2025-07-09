CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    role VARCHAR(50)
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    start_date DATE,
    end_date DATE
);

CREATE TABLE Tasks (
    task_id INT PRIMARY KEY,
    project_id INT,
    title VARCHAR(100),
    description TEXT,
    status VARCHAR(20),
    priority VARCHAR(10),
    assigned_to INT,
    due_date DATE,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (assigned_to) REFERENCES Users(user_id)
);


CREATE TABLE Comments (
    comment_id INT PRIMARY KEY,
    task_id INT,
    user_id INT,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (task_id) REFERENCES Tasks(task_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


INSERT INTO Users VALUES
(1, 'Ranveer', 'ran@example.com', 'Manager'),
(2, 'prati', 'pra@example.com', 'Developer'),
(3, 'shiri', 'shiri@example.com', 'Tester'),
(4, 'rita', 'ri@example.com', 'Developer'),
(5, 'riva', 'riva@example.com', 'Developer');

INSERT INTO Projects VALUES
(101, 'Website Revamp', 'Redesign the corporate website', '2025-06-01', '2025-08-01'),
(102, 'Mobile App', 'Develop Android and iOS app', '2025-07-01', '2025-10-01');

INSERT INTO Tasks VALUES
(1001, 101, 'Design Mockups', 'Create UI mockups', 'Completed', 'High', 1, '2025-06-15'),
(1002, 101, 'Frontend Development', 'Implement UI', 'In Progress', 'High', 2, '2025-07-15'),
(1003, 101, 'Backend API', 'Develop REST APIs', 'Not Started', 'Medium', 4, '2025-07-10'),
(1004, 102, 'Testing', 'Unit and Integration testing', 'Not Started', 'Low', 3, '2025-09-01'),
(1005, 102, 'Push Notifications', 'Implement FCM', 'In Progress', 'High', 5, '2025-08-20');

INSERT INTO Comments VALUES
(1, 1002, 1, 'Start with homepage UI first', '2025-06-20 09:00:00'),
(2, 1002, 2, 'Working on it', '2025-06-21 11:00:00'),
(3, 1005, 5, 'Need help with FCM config', '2025-07-02 15:00:00'),
(4, 1005, 1, 'Let’s discuss in standup', '2025-07-03 10:00:00');


SELECT * FROM Tasks;

SELECT * FROM Users;

SELECT T.task_id, T.title, U.name AS assigned_user
FROM Tasks T
JOIN Users U ON T.assigned_to = U.user_id;
