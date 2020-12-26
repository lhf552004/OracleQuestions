CREATE OR REPLACE TRIGGER student_inserted
BEFORE INSERT OR DELETE OR UPDATE
   ON student
   FOR EACH ROW 

DECLARE
   -- variable declarations
   v_counter number; 
   cursor cur_count IS 
    SELECT count(*) from library_user;
    v_user varchar2(20);
    v_date varchar2(20);
BEGIN
   -- trigger code
   select user, to_char(sysdate, 'DD/MON/YYYY HH24:MI:SS') into v_user, v_date from dual;
    DBMS_OUTPUT.PUT_LINE('You just inserted new line Mr.' || v_user);
    open cur_count;
   fetch cur_count into v_counter;
    insert into library_user values(v_counter + 1, 'allenli', 'Allen Li');
    close cur_count;

    IF INSERTING THEN
        INSERT INTO AUDIT_STUDENT(new_name, old_name, user_name, entry_date, operation) 
        values (:NEW.display_name, null, v_user, v_date, 'Insert');
    ELSIF DELETING THEN
        INSERT INTO AUDIT_STUDENT(new_name, old_name, user_name, entry_date, operation) 
        values (null, :OLD.display_name, v_user, v_date, 'Delete');
    ELSIF UPDATING THEN
        INSERT INTO AUDIT_STUDENT(new_name, old_name, user_name, entry_date, operation) 
        values (:NEW.display_name, :OLD.display_name, v_user, v_date, 'Update');
    END IF;
END;