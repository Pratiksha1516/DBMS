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
