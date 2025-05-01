CREATE TABLE Customer (
    Cust_id INT PRIMARY KEY,
    F_Name VARCHAR(30),
    L_Name VARCHAR(20),
    DOB DATE,
    Age INT,
    Mobile_no BIGINT,
    Email_id VARCHAR(30)
);

INSERT INTO Customer (Cust_id, F_Name, L_Name, DOB, Age, Mobile_no, Email_id)
VALUES
(1, 'Smita', 'Patil', '2005-05-01', 20, 9876543210, 'smitapatil@gmail.com'),
(2, 'Rita', 'Morrit', '1995-05-01', 30, 9123456780, 'ritamorrit@gmail.com'),
(3, 'Prerana', 'Patil', '2004-05-01', 21, 9988776655, 'preranapatil@gamil.com'),
(4, 'Shreeyesha', 'Done', '2005-05-01', 20, 9011223344, 'shreeyeshadone@gmail.com');

SELECT * FROM Customer;
 

CREATE TABLE Tickets (
    Ticket_No INT PRIMARY KEY,
    Price DECIMAL(10, 2),
    Screen_no INT,
    Seat_no VARCHAR(10)
);

INSERT INTO Tickets (Ticket_No, Price, Screen_no, Seat_no) 
VALUES
(201, 250.00, 1, 'A10'),
(202, 300.00, 2, 'B5'),
(203, 200.00, 3, 'C12'),
(204, 275.50, 1, 'A15');

SELECT * FROM Tickets;
 

CREATE TABLE Movie_Show (
    Show_id INT PRIMARY KEY,
    Language VARCHAR(30),
    Show_date DATE,
    Show_starttime TIME,
    Show_endtime TIME
);

INSERT INTO Movie_Show (Show_id, Language, Show_date, Show_starttime, Show_endtime) 
VALUES
(1, 'Marathi', '2025-05-01', '10:00:00', '12:30:00'),
(2, 'English', '2025-05-01', '13:00:00', '15:15:00'),
(3, 'Hindi', '2025-05-01', '16:00:00', '18:20:00'),
(4, 'Telugu', '2025-05-01', '19:00:00', '21:30:00');

SELECT * FROM Movie_Show;
 

CREATE TABLE Movie (
    Movie_id INT PRIMARY KEY,
    Movie_Title VARCHAR(100),
    Movie_Description TEXT,
    Movie_Stars TEXT
);

INSERT INTO Movie (Movie_id, Movie_Title, Movie_Description, Movie_Stars)
VALUES
(1, 'The Dark Knight', 'A superhero film where Batman faces the Joker, a criminal mastermind who wants to create chaos in Gotham.', 'Christian Bale, Heath Ledger, Aaron Eckhart'),
(2, 'Vivah', 'A romantic drama about the journey from engagement to marriage in traditional Indian culture.', 'Shahid Kapoor, Amrita Rao'),
(3, 'Ashi Hi Banwa Banwi', 'A Marathi comedy about four friends who disguise themselves as women to find a place to live.', 'Ashok Saraf, Laxmikant Berde, Sachin Pilgaonkar'),
(4, 'Baahubali', 'An epic tale of a prince who discovers his legacy and fights to reclaim his kingdom.', 'Prabhas, Rana Daggubati, Anushka Shetty');
SELECT * FROM Movie;
 
CREATE TABLE Theatre (
    Theatre_id INT PRIMARY KEY,
    Theatre_Name VARCHAR(100),
    Location VARCHAR(100),
    City VARCHAR(50)
);

INSERT INTO Theatre (Theatre_id, Theatre_Name, Location, City)
VALUES
(1, 'PVR INOX', 'Tilakwadi', 'Belagav'),
(2, 'Inox Kolhapur', 'Dabholkar Corner', 'Kolhapur'),
(3, 'Star Cinemas', 'Main Road', 'Inchalkaranji'),
(4, 'Carnival Sangli', 'Vishrambag', 'Sangli');

SELECT * FROM Theatre;
 
CREATE TABLE Screen (
    Screen_No INT PRIMARY KEY,
    Screen_name VARCHAR(50),
    No_of_Seats INT
);

INSERT INTO Screen (Screen_No, Screen_name, No_of_Seats)
VALUES
(1, 'Screen 1', 120),
(2, 'Screen 2', 150),
(3, 'Screen 3', 100),
(4, 'Screen 4', 180);

SELECT * FROM Screen;
 

CREATE TABLE Movie_Ticket_Booking_Website (
    Website_name VARCHAR(100) PRIMARY KEY,
    Website_url VARCHAR(255)
);
INSERT INTO Movie_Ticket_Booking_Website (Website_name, Website_url) VALUES
('BookMyShow', 'https://www.bookmyshow.com'),
('Paytm Movies', 'https://paytm.com/movies'),
('TicketNew', 'https://www.ticketnew.com'),
('JustTickets', 'https://www.justickets.in');

SELECT * FROM Movie_Ticket_Booking_Website;
 

CREATE TABLE Admin (
    Admin_Id INT PRIMARY KEY,
    Admin_name VARCHAR(100),
    Admin_role VARCHAR(50),
    Contact_no BIGINT
);

INSERT INTO Admin (Admin_Id, Admin_name, Admin_role, Contact_no)
VALUES
(1, 'Gita', 'Manager', 9876543210),
(2, 'Evaan', 'Assistant Manager', 9123456789),
(3, 'Naveen', 'Supervisor', 9988776655),
(4, 'Eshan', 'Coordinator', 9856231470);
SELECT * FROM Admin;
 
--UPDATE 
UPDATE Admin
SET Admin_role = 'Director'
WHERE Admin_name = 'Evaan';
 
UPDATE Customer
SET Mobile_no = 9036327310
WHERE Cust_id = 1;
 

--DELETE
DELETE FROM Theatre
WHERE Theatre_id = 3;
 
DELETE FROM Movie
WHERE Movie_Title = 'Vivah';
 

--ALTER 
ALTER TABLE Admin
ADD Email_id VARCHAR(50);
 

ALTER TABLE Movie
ADD Genre VARCHAR(50);
 
--DROP
DROP TABLE Admin;
 
DROP TABLE Movie_Ticket_Booking_Website;
 
--Aggregation queries
SELECT COUNT(Cust_id)
FROM Customer;
 

SELECT MAX(Price)
FROM Tickets;
 
SELECT MIN(Price)
FROM Tickets;
 
SELECT AVG(Price)
FROM Tickets;
 
--JOINS
SELECT Customer.F_Name, Customer.L_Name
FROM Customer
LEFT JOIN Tickets
ON Customer.Cust_id = Tickets.Ticket_No;
 

SELECT Customer.F_Name, Customer.L_Name,Price, Screen_no, Seat_no
FROM Customer
RIGHT JOIN Tickets
ON Customer.Cust_id = Tickets.Ticket_No;
 
SELECT Customer.F_Name, Tickets.Seat_no
FROM Customer
INNER JOIN Tickets
ON Customer.Cust_id = Tickets.Ticket_No;
 
ALTER TABLE Screen
ADD Theatre_id INT;

INSERT INTO Screen (Screen_No, Screen_name, No_of_Seats, Theatre_id) VALUES
(101, 'Screen 1', 150, 1),
(102, 'Screen 2', 200, 2),
(103, 'Screen A', 120, 3),
(104, 'Screen B', 180, NULL);

SELECT COALESCE(Theatre.Theatre_Name, 'Not Assigned') AS Theatre_Name,Theatre.Location,Screen.Screen_No,Screen.Screen_name
FROM Theatre
FULL OUTER JOIN Screen
ON Theatre.Theatre_id = Screen.Theatre_id;
 
