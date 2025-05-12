create table student(
    roll_no number primary key,
    name varchar(50),
    address varchar(40),
    contact int
);

create or replace procedure insert_val(
    s_roll_no student.roll_no%type,
    s_name student.name%type,
    s_address student.address%type,
    s_contact student.contact%type
)is
begin
	insert into student(roll_no, name, address, contact)
	values(s_roll_no, s_name, s_address,s_contact);
end;

begin
insert_val(1,'ranveer','xyyzz', 1324);
end;

select e.roll_no, e.name, e.address, e.contact from student e;