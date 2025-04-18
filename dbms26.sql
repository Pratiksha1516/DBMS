CREATE TABLE IF NOT EXISTS city1(
pin INT PRIMARY KEY,
name VARCHAR(20) CHECK (name = 'Sangli')
);

INSERT INTO city1(pin, name)
VALUES
(123456, 'BELAGAV');  -- above there is check constraint where i have used that for name of the city if i have used city name rather than Sangli then it will throw an 

INSERT INTO city1(pin, name)
VALUES
(234567, 'Sangli');  -- here data is inserted successfully