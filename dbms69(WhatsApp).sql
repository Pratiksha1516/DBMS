CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(100),
    PhoneNumber VARCHAR(15) UNIQUE,
    StatusMessage VARCHAR(200),
    LastSeen TIMESTAMP
);