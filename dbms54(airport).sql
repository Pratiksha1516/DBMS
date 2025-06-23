CREATE TABLE Airport (
    airport_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE Airline (
    airline_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE Flight (
    flight_id SERIAL PRIMARY KEY,
    flight_number VARCHAR(20),
    departure_airport INT REFERENCES Airport(airport_id),
    arrival_airport INT REFERENCES Airport(airport_id),
    airline_id INT REFERENCES Airline(airline_id),
    departure_time TIMESTAMP,
    arrival_time TIMESTAMP
);

CREATE TABLE Passenger (
    passenger_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    passport_no VARCHAR(20)
);

CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    flight_id INT REFERENCES Flight(flight_id),
    passenger_id INT REFERENCES Passenger(passenger_id),
    booking_date DATE,
    seat_no VARCHAR(10)
);

INSERT INTO Airport (name, city, country)
VALUES 
('Kempegowda International', 'Bangalore', 'India'),
('Chhatrapati Shivaji', 'Mumbai', 'India'),
('Heathrow', 'London', 'UK');

INSERT INTO Airline (name, country)
VALUES 
('IndiGo', 'India'),
('Air India', 'India'),
('British Airways', 'UK');

INSERT INTO Flight (flight_number, departure_airport, arrival_airport, airline_id, departure_time, arrival_time)
VALUES 
('AI101', 1, 2, 2, '2025-06-25 10:00', '2025-06-25 12:00'),
('BA202', 3, 2, 3, '2025-06-26 15:00', '2025-06-26 23:00');

INSERT INTO Passenger (name, passport_no)
VALUES 
('Pratiksha', 'IND123456'),
('Ranveer', 'IND789101'),
('Shree', 'UK456789');

INSERT INTO Booking (flight_id, passenger_id, booking_date, seat_no)
VALUES 
(1, 1, '2025-06-20', '12A'),
(1, 2, '2025-06-21', '12B'),
(2, 3, '2025-06-22', '1C');


--
SELECT * FROM Airport;

SELECT * FROM Airline;

SELECT * FROM Flight;

SELECT * FROM Passenger;

SELECT * FROM Booking;

SELECT flight_number, departure_airport, arrival_airport
FROM Flight;

SELECT name, passport_no
FROM passenger;

SELECT * FROM Booking
WHERE passenger_id = 2;
