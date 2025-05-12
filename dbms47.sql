CREATE TYPE Name_ty AS OBJECT
(
    fname varchar(20),
    lname varchar(10)
)

CREATE TYPE Inv_ty AS OBJECT
(
    Inv_no varchar(5),
    Cust_id varchar(4)
)

create table Customer
(
    Cust_id varchar(4),
    NAME Name_ty,
    Area varchar(100),
    Ph_no int
);

insert into Customer 
(Cust_id, NAME, Area, Ph_no)
values
(1, Name_ty('prati','patil'), 'Atigre', 1234);

insert into Customer values
(2, Name_ty('ranveer', 'Ghorpade'), 'Sangli', 4567);

select * from customer;
select c.Cust_id, c.NAME.fname, c.NAME.lname, c.Area, c.Ph_no 
from Customer c;

update Customer c 
set Ph_no = 82935
where c.NAME.fname = 'ranveer';

select c.NAME.fname, c.NAME.lname
from Customer c
where c.NAME.fname like '_a%';