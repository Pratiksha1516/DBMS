create or replace procedure demo5 IS
begin
	dbms_output.put_line('hello');
end;

BEGIN
demo5;
END;

DECLARE PROCEDURE mssg IS
BEGIN
	DBMS_OUTPUT.PUT_LINE('HELLO');
END mssg;
BEGIN
mssg;
END;