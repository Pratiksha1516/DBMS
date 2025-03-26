create table stud(
    stud_name varchar(20),
    stud_contact int
);

INSERT INTO stud VALUES  ('rita', 524681354);
INSERT INTO stud VALUES   ('ram', 5468762164);


SELECT stud_name FROM stud WHERE stud_name LIKE '___a%';

SELECT * FROM stud WHERE stud_name = 'ram';
