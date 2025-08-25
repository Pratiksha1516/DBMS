CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(100),
    PhoneNumber VARCHAR(15) UNIQUE,
    StatusMessage VARCHAR(200),
    LastSeen TIMESTAMP
);

CREATE TABLE Chats (
    ChatID INT PRIMARY KEY,
    ChatName VARCHAR(100),   
    IsGroup BOOLEAN
);

CREATE TABLE ChatMembers (
    ChatID INT,
    UserID INT,
    Role VARCHAR(20),  -- e.g., 'admin', 'member'
    PRIMARY KEY (ChatID, UserID),
    FOREIGN KEY (ChatID) REFERENCES Chats(ChatID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Messages (
    MessageID INT PRIMARY KEY,
    ChatID INT,
    SenderID INT,
    Content TEXT,
    SentAt TIMESTAMP,
    FOREIGN KEY (ChatID) REFERENCES Chats(ChatID),
    FOREIGN KEY (SenderID) REFERENCES Users(UserID)
);

CREATE TABLE MessageStatus (
    MessageID INT,
    UserID INT,
    Status VARCHAR(20),  -- 'sent', 'delivered', 'seen'
    SeenAt TIMESTAMP,
    PRIMARY KEY (MessageID, UserID),
    FOREIGN KEY (MessageID) REFERENCES Messages(MessageID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Users (UserID, Name, PhoneNumber, StatusMessage, LastSeen) VALUES
(1, 'Pratiksha', '9876543210', 'Busy', '2025-08-21 22:10:00'),
(2, 'Ranveer', '9876500001', 'Available', '2025-08-22 09:15:00'),
(3, 'Shree', '9876500002', 'At Work', '2025-08-22 08:30:00'),
(4, 'Jenny', '9876500003', 'Chilling', '2025-08-22 10:45:00'),
(5, 'Sahil', '9876500004', 'On Vacation', '2025-08-21 23:59:00');

INSERT INTO Chats (ChatID, ChatName, IsGroup) VALUES
(101, NULL, FALSE),  
(102, NULL, FALSE),   
(201, 'Friends Group', TRUE);

INSERT INTO ChatMembers (ChatID, UserID, Role) VALUES
(101, 1, 'member'),
(101, 2, 'member'),
(102, 3, 'member'),
(102, 4, 'member'),
(201, 1, 'admin'),
(201, 2, 'member'),
(201, 3, 'member'),
(201, 4, 'member'),
(201, 5, 'member');

INSERT INTO Messages (MessageID, ChatID, SenderID, Content, SentAt) VALUES
(1001, 101, 1, 'Hey Ranveer!', '2025-08-22 09:00:00'),
(1002, 101, 2, 'Hi Pratiksha! How are you?', '2025-08-22 09:01:00'),
(1003, 102, 3, 'Hello Jenny!', '2025-08-22 08:35:00'),
(1004, 102, 4, 'Hey Sahil! Long time no see.', '2025-08-22 08:40:00'),
(1005, 201, 1, 'Good morning everyone!', '2025-08-22 07:50:00'),
(1006, 201, 3, 'Morning!', '2025-08-22 07:55:00'),
(1007, 201, 4, 'Hi guys!', '2025-08-22 08:00:00'),
(1008, 201, 5, 'Hello!!', '2025-08-22 08:10:00');

INSERT INTO MessageStatus (MessageID, UserID, Status, SeenAt) VALUES
(1001, 2, 'seen', '2025-08-22 09:01:30'),
(1002, 1, 'seen', '2025-08-22 09:01:45'),
(1003, 4, 'seen', '2025-08-22 08:41:00'),
(1004, 3, 'seen', '2025-08-22 08:42:00'),
(1005, 2, 'seen', '2025-08-22 07:52:00'),
(1005, 3, 'seen', '2025-08-22 07:53:00'),
(1005, 4, 'delivered', NULL),
(1005, 5, 'seen', '2025-08-22 07:54:00');

SELECT MessageID, ChatID, Content 
FROM Messages;

SELECT ChatID 
FROM Chats 
WHERE IsGroup = FALSE;

SELECT MIN(SentAt) AS FirstMessageTime
FROM Messages;

SELECT MAX(SentAt) AS LatestMessageTime 
FROM Messages;

SELECT COUNT(*) AS TotalUsers 
FROM Users;

SELECT UserID 
FROM ChatMembers 
WHERE ChatID = 101;

SELECT ChatName 
FROM Chats 
WHERE IsGroup = TRUE;

SELECT Name, PhoneNumber, StatusMessage, LastSeen 
FROM Users;

SELECT Content FROM Messages m
JOIN Users u ON m.SenderID = u.UserID
WHERE u.Name = 'Jenny';

SELECT u.Name, cm.Role
FROM ChatMembers cm
JOIN Users u ON cm.UserID = u.UserID
WHERE cm.ChatID = 201;

SELECT ChatID, ChatName 
FROM Chats 
WHERE IsGroup = TRUE;

SELECT ChatID 
FROM Chats 
WHERE IsGroup = FALSE;

SELECT ChatID, COUNT(UserID) AS MemberCount
FROM ChatMembers
GROUP BY ChatID;

SELECT u.Name AS Sender, m.Content, m.SentAt
FROM Messages m
JOIN Users u ON m.SenderID = u.UserID
WHERE m.ChatID = 101
ORDER BY m.SentAt;

SELECT Content, SentAt 
FROM Messages m
JOIN Users u ON m.SenderID = u.UserID
WHERE u.Name = 'Pratiksha';

SELECT u.Name, COUNT(m.MessageID) AS TotalMessages
FROM Users u
JOIN Messages m ON u.UserID = m.SenderID
GROUP BY u.Name
ORDER BY TotalMessages DESC
LIMIT 1;

SELECT c.ChatID, COALESCE(c.ChatName, 'Personal Chat') AS ChatName,
       m.Content AS LastMessage, u.Name AS Sender, m.SentAt
FROM Chats c
JOIN Messages m ON c.ChatID = m.ChatID
JOIN Users u ON m.SenderID = u.UserID
WHERE m.SentAt = (
   SELECT MAX(m2.SentAt) FROM Messages m2 WHERE m2.ChatID = c.ChatID
);

SELECT COUNT(*) AS GroupMessages
FROM Messages
WHERE ChatID = 201;

--
SELECT c.ChatID, c.ChatName, COUNT(cm.UserID) AS Members
FROM Chats c
JOIN ChatMembers cm ON c.ChatID = cm.ChatID
WHERE c.IsGroup = TRUE
GROUP BY c.ChatID, c.ChatName;

SELECT Name, LastSeen
FROM Users
ORDER BY LastSeen DESC;

SELECT m.Content, u.Name, m.SentAt
FROM Messages m
JOIN Users u ON m.SenderID = u.UserID
WHERE m.SentAt > '2025-08-22 09:00:00';

SELECT DISTINCT u.Name
FROM ChatMembers cm
JOIN Users u ON cm.UserID = u.UserID
WHERE cm.Role = 'admin';

SELECT c.ChatID
FROM Chats c
WHERE c.IsGroup = FALSE
AND EXISTS (
    SELECT 1 FROM Messages m WHERE m.ChatID = c.ChatID
);

SELECT DISTINCT c.ChatID, COALESCE(c.ChatName, 'Personal Chat') AS ChatName
FROM Messages m
JOIN Chats c ON m.ChatID = c.ChatID
JOIN Users u ON m.SenderID = u.UserID
WHERE u.Name = 'Ranveer';

SELECT EXTRACT(HOUR FROM SentAt) AS Hour, COUNT(*) AS TotalMessages
FROM Messages
GROUP BY EXTRACT(HOUR FROM SentAt)
ORDER BY Hour;

SELECT u.Name, COUNT(DISTINCT cm.ChatID) AS TotalChats
FROM Users u
JOIN ChatMembers cm ON u.UserID = cm.UserID
GROUP BY u.Name;



















