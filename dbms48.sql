create type name_ty as object
(
    fname varchar(20),
    lname varchar(10)
)

create type addr_ty as object
(
    city varchar(20),
    pincode number
)

create type employee_ty as object
(
    emp_id number,
    name name_ty,
    address addr_ty
)not final;

drop type parttime_emp_ty;

CREATE TYPE fulltime_emp_ty UNDER employee_ty (
    salary NUMBER
)not final;

create type parttime_emp_ty under employee_ty(
    Rate number,
    Hours number
)

create table fulltime of fulltime_emp_ty;

create table parttime of parttime_emp_ty;


