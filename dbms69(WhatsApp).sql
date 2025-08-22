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
