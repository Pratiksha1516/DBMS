create table setA(
element int
);

create table setB(
element int
);

insert into setA(element) values
(1), (2), (3), (4), (5), (6);

insert into setB(element) values
(2), (3), (4), (5), (6), (7), (8);

select * from setA;



select count(element)
from(
	select element from setA
	UNION
	select element from setB
) AS UnionResult;

