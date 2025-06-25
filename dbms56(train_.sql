CREATE TABLE Train (
    train_id INT PRIMARY KEY,
    train_name VARCHAR(100),
    train_type VARCHAR(50)
);

CREATE TABLE Station (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE Passenger (
    passenger_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    age INT
);

CREATE TABLE Route (
    route_id SERIAL PRIMARY KEY,
    train_id INT,
    station_id INT,
    arrival_time TIME,
    departure_time TIME,
    stop_number INT,
    FOREIGN KEY (train_id) REFERENCES Train(train_id),
    FOREIGN KEY (station_id) REFERENCES Station(station_id)
);

CREATE TABLE Ticket (
    ticket_id INT PRIMARY KEY,
    passenger_id INT,
    train_id INT,
    source_station_id INT,
    destination_station_id INT,
    travel_date DATE,
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id),
    FOREIGN KEY (train_id) REFERENCES Train(train_id),
    FOREIGN KEY (source_station_id) REFERENCES Station(station_id),
    FOREIGN KEY (destination_station_id) REFERENCES Station(station_id)
);


INSERT INTO Train VALUES
(101, 'Rajdhani Express', 'Superfast'),
(102, 'Shatabdi Express', 'Fast'),
(103, 'Duronto Express', 'Superfast');

INSERT INTO Station VALUES
(1, 'Mumbai Central', 'Mumbai'),
(2, 'Pune Junction', 'Pune'),
(3, 'Nagpur Station', 'Nagpur'),
(4, 'Delhi Junction', 'Delhi'),
(5, 'Chennai Central', 'Chennai');

INSERT INTO Passenger VALUES
(1, 'Pratiksha', 'Female', 23),
(2, 'Ranveer', 'Male', 25),
(3, 'Shree', 'Female', 20),
(4, 'Sahil', 'Male', 30),
(5, 'Jenny', 'Female', 28);

INSERT INTO Route (train_id, station_id, arrival_time, departure_time, stop_number) VALUES
(101, 1, '06:00:00', '06:10:00', 1),
(101, 2, '09:00:00', '09:10:00', 2),
(101, 4, '20:00:00', '20:10:00', 3),
(102, 1, '07:00:00', '07:15:00', 1),
(102, 3, '13:00:00', '13:20:00', 2),
(102, 5, '20:30:00', '20:45:00', 3);

INSERT INTO Ticket VALUES
(1001, 1, 101, 1, 4, '2025-07-01'),
(1002, 2, 102, 1, 5, '2025-07-02'),
(1003, 3, 101, 2, 4, '2025-07-01'),
(1004, 4, 102, 1, 3, '2025-07-03'),
(1005, 5, 103, 1, 5, '2025-07-04');

--
SELECT * FROM Train;

SELECT * FROM Passenger;

SELECT station_name FROM Station
WHERE city = 'Delhi';

SELECT * FROM Ticket 
WHERE travel_date = '2025-07-01';

SELECT name FROM Passenger 
WHERE gender = 'Female';

SELECT train_name FROM Train
WHERE train_type = 'Superfast';

SELECT * FROM Ticket 
WHERE ticket_id = 1003;

SELECT DISTINCT city FROM Station;

SELECT COUNT(*) FROM Passenger 
WHERE age > 25;

SELECT * FROM Ticket
WHERE source_station_id = 1 AND destination_station_id = 4;

SELECT p.name
FROM Passenger p
JOIN Ticket tk ON p.passenger_id = tk.passenger_id
WHERE tk.source_station_id = 1;

SELECT t.train_name, s.station_name
FROM Route r
JOIN Train t ON r.train_id = t.train_id
JOIN Station s ON r.station_id = s.station_id
WHERE r.stop_number = 1;

SELECT p.name, t.ticket_id, t.train_id, t.travel_date
FROM Passenger p
JOIN Ticket t ON p.passenger_id = t.passenger_id;

--List route of train 101
SELECT t.train_name, s.station_name, r.arrival_time, r.departure_time
FROM Train t
JOIN Route r ON t.train_id = r.train_id
JOIN Station s ON r.station_id = s.station_id
WHERE t.train_id = 101
ORDER BY r.stop_number;
