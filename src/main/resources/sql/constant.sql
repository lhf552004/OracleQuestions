set serveroutput on;

declare 
    v_pi constant number(7, 6) := 3.14;
begin
    DBMS_OUTPUT.PUT_LINE(v_pi);
end;
