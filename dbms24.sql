CREATE TABLE stud_temp3(
stud_id INT UNIQUE
);

INSERT INTO stud_temp3 values (101);

SELECT * FROM stud_temp3;

CREATE TABLE IF NOT EXISTS temp3(
id INT,
FOREIGN KEY(id) REFERENCES stud_temp3(stud_id),
name VARCHAR,
city VARCHAR
);

INSERT INTO temp3(id,name, city)
VALUES
(101,'PRATI','BELAGAV'); --here i have used foreign key concept and applied that

SELECT * FROM temp3;

TRUNCATE TABLE temp2;

DROP TABLE temp2;
