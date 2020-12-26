VARIABLE v_bind1 VARCHAR2(10);
exec :v_bind1 := 'my bind variable';

begin 
    :v_bind1 := 'Allen';
     DBMS_OUTPUT.PUT_LINE(:v_bind1);
end;