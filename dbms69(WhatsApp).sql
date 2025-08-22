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
