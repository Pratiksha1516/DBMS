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
