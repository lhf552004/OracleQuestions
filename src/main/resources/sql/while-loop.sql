set serveroutput on;

declare
    v_counter number := 0;
    v_result number;
begin
    while v_counter <=10 loop
        v_counter := v_counter +1;
        v_result := 19* v_counter;
        DBMS_OUTPUT.PUT_LINE('19 * ' || v_counter || ' = ' || v_result);
   end loop;
   
end;