create or replace procedure pr_without_para
is
    v_name varchar2(20) := 'Allen';
    v_web varchar2(50) := 'https://lhf552004.github.io';
begin
    dbms_output.put_line('I am ' || v_name || ' and my website is ' || v_web );
end;