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

