create or replace function demo2
return varchar as
begin
DBMS_OUTPUT.PUT_LINE('hello');
return 'message printed';
end;

declare
a number:= 2;
b number:=9;
c number;
function add(x in number, y in number)
return number is
    z number;
begin
	z:= x+y;
	return z;
end;
begin
	c:= add(a,b);
	dbms_output.put_line('sum is: ' ||c);
end;