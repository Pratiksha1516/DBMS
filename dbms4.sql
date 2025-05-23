create table stud(
    stud_name varchar(20),
    stud_contact int
);

INSERT INTO stud 
(stud_name,stud_contact)
VALUES  
('rita', 524681354),
('ram', 54687621);

select * from stud;

--Aggregation function
SELECT COUNT(stud)
FROM stud;

SELECT MAX(stud_contact)
FROM stud;

SELECT MIN(stud_contact)
FROM stud;

SELECT MIN(stud_name)
FROM stud;

SELECT MAX(stud_name)
FROM stud;

SELECT *
FROM stud
WHERE stud_name like '%m';

SELECT stud_name 
FROM stud 
WHERE stud_name LIKE '___a%';

SELECT *
FROM stud 
WHERE stud_name = 'ram';

SELECT * 
FROM stud 
WHERE stud_contact = 1100;

delete from stud
where stud_name = 'rita;

select stud_name
from stud
where stud_contact = 5468762164;

select stud_contact
from stud
where stud_name = 'ram'; 

ALTER TABLE stud
ADD COLUMN age INT;

truncate table stud;
    
drop table stud;
