CREATE TABLE Vehicle (
    VehicleID INT PRIMARY KEY,
    VehicleNumber VARCHAR(20) UNIQUE,
    Type VARCHAR(50),
    Capacity INT
);