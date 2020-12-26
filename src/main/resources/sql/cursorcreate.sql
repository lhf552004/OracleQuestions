set serveroutput on;

declare 
    v_name varchar2(30);
    cursor cur_my IS 
    SELECT display_name from employee
    where id<135;
begin
    open cur_my;
    loop
        fetch cur_my into v_name;
        DBMS_OUTPUT.PUT_LINE(v_name);
        exit when cur_my%notfound;
    end loop;
    close cur_my;
end;
