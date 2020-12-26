declare
    v_num number := 12;
    v_author varchar(20) := 'allen';
begin
    IF v_num < 10 and v_author = 'allen' then
         DBMS_OUTPUT.PUT_LINE('Condition achieved');
    elsif v_num = 11 then
        DBMS_OUTPUT.PUT_LINE('Second condition not achieved');
    else
        DBMS_OUTPUT.PUT_LINE('Condition not achieved');
    end if;
   
end;