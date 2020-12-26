set serveroutput on;

declare 
    v_name varchar2(30);
begin
    select display_name into v_name from employee
    where id = 135;
    DBMS_OUTPUT.PUT_LINE(v_name);
end;
/

DECLARE
    v_display_name varchar2(20);
    v_user_name varchar2(20);
BEGIN
    SELECT display_name, user_name into v_display_name, v_user_name from employee
    where id = 135;
    DBMS_OUTPUT.PUT_LINE('Display name ' || v_display_name || ' User name ' || v_user_name);
end;
