set serveroutput on;

declare
    v_counter number := 0;
    v_result number;
begin
    DBMS_OUTPUT.PUT_LINE('For loop');
   for v_counter in reverse 1 .. 10 loop
        v_result := 19* v_counter;
        DBMS_OUTPUT.PUT_LINE('19 * ' || v_counter || ' = ' || v_result);
   end loop;
   
end;