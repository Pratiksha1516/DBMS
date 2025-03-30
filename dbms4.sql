create table stud(
    stud_name varchar(20),
    stud_contact int
);

INSERT INTO stud VALUES  ('rita', 524681354);
INSERT INTO stud VALUES   ('ram', 5468762164);

select * from stud;

SELECT stud_name FROM stud WHERE stud_name LIKE '___a%';

SELECT * FROM stud WHERE stud_name = 'ram';

SELECT * FRROM stud WHERE stud_contact = 1100;

delete from stud where stud_name = 'rita;

select stud_name
from stud
where stud_contact = 5468762164;

truncate table stud;

drop table stud;
