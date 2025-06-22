CREATE TABLE temp1(
id INT UNIQUE
);

INSERT INTO temp1 values (101);

SELECT * FROM temp1;

CREATE TABLE IF NOT EXISTS temp2(
id INT,
name VARCHAR,
city VARCHAR,
PRIMARY KEY(id, name)
);

INSERT INTO temp2(id, name, city)
VALUES
(1, 'PRATI', 'BELAGAV');

SELECT * FROM temp2;

INSERT INTO temp2(id, name, city)  /*Here it is duplcate entry so It will throw error */ 
VALUES
(1, 'PRATI', 'BELAGAV');

SELECT LOWER(name)
FROM temp2;

SELECT LENGTH(name)
FROM temp2;

SELECT LENGTH(city)
FROM temp2;

SELECT LOWER(city)
FROM temp2;
