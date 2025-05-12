declare procedure mssg as
begin
	dbms_output.put_line('hello');
end;
begin
mssg;
end;

create or replace procedure squareip(
    a in number,
    b out number
)is
begin
b:= a*a;
end;

declare 
	x number;
	procedure squarenum(x in out number) is
begin
x:= x*x;
end;
begin
x:=2;
squarenum(x);
	dbms_output.put_line('square is:' ||x);
end;