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

SELECT flight_number 
FROM Flight
WHERE airline_id = 2;

SELECT * FROM Booking 
WHERE booking_date = '2025-06-20';

SELECT * 
FROM Airport
WHERE country = 'India'; 

SELECT * FROM Flight
WHERE  airline_id = 2;

SELECT * FROM Flight 
WHERE departure_time >= CURRENT_DATE;

--
SELECT p.name, b.seat_no
FROM Booking b
JOIN Passenger p ON b.passenger_id = p.passenger_id
WHERE b.flight_id = 1;

SELECT f.flight_number, a1.name AS from_airport, a2.name AS to_airport
FROM Flight f
JOIN Airport a1 ON f.departure_airport = a1.airport_id
JOIN Airport a2 ON f.arrival_airport = a2.airport_id
WHERE a1.city = 'Mumbai' AND a2.city = 'Delhi';

--count of flights operated by each airline
SELECT al.name, COUNT(*) AS total_flights
FROM Flight f
JOIN Airline al ON f.airline_id = al.airline_id
GROUP BY al.name;

--
SELECT name, passport_no 
FROM Passenger 
WHERE passenger_id IN (
    SELECT passenger_id 
    FROM Booking 
    WHERE seat_no LIKE '12%'
);

SELECT flight_number 
FROM Flight 
WHERE departure_airport = (
    SELECT airport_id FROM Airport WHERE name = 'Heathrow'
);

SELECT * 
FROM Booking 
WHERE booking_date > '2025-06-21';

SELECT * 
FROM Airline 
WHERE country = 'UK';

SELECT COUNT(*) AS total_passengers 
FROM Passenger;

SELECT p.name, COUNT(*) AS booking_count 
FROM Booking b
JOIN Passenger p ON b.passenger_id = p.passenger_id
GROUP BY p.name;

SELECT COUNT(*) 
FROM Flight f
JOIN Airport a1 ON f.departure_airport = a1.airport_id
JOIN Airport a2 ON f.arrival_airport = a2.airport_id
WHERE a1.city = 'Bangalore' AND a2.city = 'Mumbai';

SELECT * 
FROM Flight 
WHERE departure_time BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '7 days';

SELECT * 
FROM Flight 
ORDER BY arrival_time ASC 
LIMIT 1;

SELECT * 
FROM Booking 
WHERE booking_date BETWEEN '2025-06-20' AND '2025-06-25';

SELECT f.flight_number, al.name AS airline_name, a.city AS departure_city 
FROM Flight f
JOIN Airline al ON f.airline_id = al.airline_id
JOIN Airport a ON f.departure_airport = a.airport_id;

SELECT DISTINCT p.name 
FROM Booking b
JOIN Flight f ON b.flight_id = f.flight_id
JOIN Airline a ON f.airline_id = a.airline_id
JOIN Passenger p ON b.passenger_id = p.passenger_id
WHERE a.name = 'Air India';
