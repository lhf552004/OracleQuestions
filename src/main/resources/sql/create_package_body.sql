create or replace package body pkg_RebellionRider IS
    FUNCTION print_strng return varchar2 IS
        BEGIN 
            RETURN 'RebellionRider.com';
    END print_strng;
    PROCEDURE proc_employee(id NUMBER, user_name varchar2, display_name varchar2) IS
        BEGIN 
            INSERT INTO employee (id, user_name, display_name) values (id, user_name, display_name);
        END ;
end pkg_RebellionRider;