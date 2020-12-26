set serveroutput on;

declare 
    v_name varchar2(30) := 'Hello world';
begin
    DBMS_OUTPUT.PUT_LINE(v_name);
end;
