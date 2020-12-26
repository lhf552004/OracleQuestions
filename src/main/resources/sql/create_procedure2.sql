create or replace procedure pr_update_emp (e_id number, displayname varchar2)
is
begin
    update employee set display_name = displayname where id = e_id;
    dbms_output.put_line('procedure executed.');
end;