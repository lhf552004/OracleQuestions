create or replace package pkg_RebellionRider IS
    FUNCTION print_strng return VARCHAR2;
    PROCEDURE proc_employee (id NUMBER, user_name VARCHAR2, display_name varchar2);
end pkg_RebellionRider;