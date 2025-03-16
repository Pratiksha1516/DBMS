  CREATE TABLE Customer (  
    CustomerID SERIAL PRIMARY KEY,  
    FirstName VARCHAR(50),  
    LastName VARCHAR(50),  
    PhoneNumber VARCHAR(15),  
    Email VARCHAR(50)  
);  
 
CREATE TABLE Car (  
    CarID SERIAL PRIMARY KEY,  
    Model VARCHAR(50),  
    Brand VARCHAR(50),  
    Year INT,  
    RentalPricePerDay DECIMAL,  
    Status VARCHAR(20)  
);  

CREATE TABLE Rental (  
    RentalID SERIAL PRIMARY KEY,  
    CustomerID INT REFERENCES Customer(CustomerID),  
    CarID INT REFERENCES Car(CarID),  
    RentalDate DATE,  
    ReturnDate DATE,  
    TotalAmount DECIMAL  
);  

CREATE TABLE Payment (  
    PaymentID SERIAL PRIMARY KEY,  
    RentalID INT REFERENCES Rental(RentalID),  
    AmountPaid DECIMAL,  
    PaymentDate DATE,  
    PaymentMode VARCHAR(20)  
);  

INSERT INTO Customer (FirstName, LastName, PhoneNumber, Email)
VALUES
('Ranveer', 'Ghorpade', '9876543210', 'ranveer@email.com'),
('Sahil', 'Ambekar', '9123456780', 'sahil@email.com'),
('Pratiksha', 'Patil', '9988776655', 'pratiksha@email.com'),
('Jenny', 'Lewis', '9876501234', 'jenny@email.com'),
('Shree', 'Lohar', '7890654321', 'shree@email.com');

select * from Customer;

INSERT INTO Car (CarID,Model, Brand, Year, RentalPricePerDay, Status)  
VALUES  
(1,'Civic', 'Honda', 2022, 50.00, 'Available'),  
(2,'Model S', 'Tesla', 2023, 120.00, 'Available'),  
(3,'Corolla', 'Toyota', 2021, 40.00, 'Available'),  
(4,'Mustang', 'Ford', 2020, 80.00, 'Available'),  
(5,'Swift', 'Maruti', 2019, 30.00, 'Available');  

select * from car;

INSERT INTO Rental (CustomerID, CarID, RentalDate, ReturnDate, TotalAmount)  
VALUES  
(1, 1, '2025-03-15', '2025-03-17', 100.00),  
(2, 2, '2025-03-16', '2025-03-18', 240.00),  
(3, 3, '2025-03-14', '2025-03-16', 80.00),  
(4, 4, '2025-03-17', '2025-03-19', 160.00),  
(5, 5, '2025-03-15', '2025-03-18', 90.00);  

select * from Rental;

INSERT INTO Payment (RentalID, AmountPaid, PaymentDate, PaymentMode)  
VALUES  
(1, 100.00, '2025-03-17', 'Card'),  
(2, 240.00, '2025-03-18', 'Online'),  
(3, 80.00, '2025-03-16', 'Cash'),  
(4, 160.00, '2025-03-19', 'Card'),  
(5, 90.00, '2025-03-18', 'Online');  

select * from Payment;
  
UPDATE Car SET Status = 'Rented' WHERE CarID = 1;
UPDATE Car SET Status = 'Rented' WHERE CarID = 3;
select * from car order by carid;

DELETE FROM Payment WHERE PaymentMode = 'Cash';
select * from Payment;

ALTER TABLE Car ADD COLUMN Mileage INT; 
select * from Car;

DROP TABLE Payment;  

SELECT MAX(TotalAmount) AS Maximum_Rental, 
       MIN(TotalAmount) AS Minimum_Rental FROM Rental;

SELECT COUNT(*) AS Total_Rentals
FROM Rental;
SELECT Status, COUNT(*) AS Count FROM Car 
GROUP BY Status;

SELECT AVG(RentalPricePerDay) AS Average_Rental_Price
FROM Car;

SELECT SUM(TotalAmount) AS Total_Revenue
FROM Rental;

SELECT R.RentalID, C.FirstName, C.LastName, CA.Model, CA.Brand, R.TotalAmount
FROM Rental R
INNER JOIN Customer C ON R.CustomerID = C.CustomerID
INNER JOIN Car CA ON R.CarID = CA.CarID;

SELECT C.FirstName, C.LastName, R.RentalID, R.TotalAmount
FROM Customer C
LEFT JOIN Rental R ON C.CustomerID = R.CustomerID;

SELECT C.FirstName, C.LastName, R.RentalID, R.TotalAmount
FROM Rental R
RIGHT JOIN Customer C ON R.CustomerID = C.CustomerID;

SELECT C.FirstName, C.LastName, R.RentalID, R.TotalAmount
FROM Customer C
FULL JOIN Rental R ON C.CustomerID = R.CustomerID;


CREATE TABLE CarDetailsJSON (
    CarID SERIAL PRIMARY KEY,
    CarInfo JSON
);

INSERT INTO CarDetailsJSON (CarInfo)
VALUES 
('{"Brand": "Toyota", "Model": "Camry", "Year": 2022, "RentalPricePerDay": 80, "Status": "Available"}'),
('{"Brand": "Honda", "Model": "Civic", "Year": 2021, "RentalPricePerDay": 70, "Status": "Rented"}'),
('{"Brand": "Ford", "Model": "Mustang", "Year": 2023, "RentalPricePerDay": 120, "Status": "Available"}'),
('{"Brand": "BMW", "Model": "X5", "Year": 2022, "RentalPricePerDay": 150, "Status": "Rented"}'),
('{"Brand": "Mercedes", "Model": "C-Class", "Year": 2023, "RentalPricePerDay": 140, "Status": "Available"}');


SELECT * FROM CarDetailsJSON;

SELECT 
    CarInfo->>'Brand' AS Brand, 
    CarInfo->>'Model' AS Model 
FROM CarDetailsJSON;

SELECT 
    CarInfo->>'Brand' AS Brand, 
    CarInfo->>'Model' AS Model 
FROM CarDetailsJSON
WHERE CarInfo->>'Status' = 'Available';

SELECT 
    CarInfo->>'Brand' AS Brand,
    CarInfo->>'Model' AS Model,
    CarInfo->>'RentalPricePerDay' AS Price
FROM CarDetailsJSON
WHERE (CarInfo->>'RentalPricePerDay')::INT > 100;


