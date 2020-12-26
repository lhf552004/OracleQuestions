--------------------------------------------------------
--  File created - Saturday-December-26-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AUDIT_STUDENT
--------------------------------------------------------

  CREATE TABLE "C###ALLEN"."AUDIT_STUDENT" 
   (	"NEW_NAME" VARCHAR2(50 BYTE), 
	"OLD_NAME" VARCHAR2(50 BYTE), 
	"USER_NAME" VARCHAR2(50 BYTE), 
	"ENTRY_DATE" VARCHAR2(50 BYTE), 
	"OPERATION" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table LIBRARY_USER
--------------------------------------------------------

  CREATE TABLE "C###ALLEN"."LIBRARY_USER" 
   (	"ID" NUMBER(*,0), 
	"USER_NAME" VARCHAR2(50 BYTE), 
	"DISPLAY_NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table STUDENT
--------------------------------------------------------

  CREATE TABLE "C###ALLEN"."STUDENT" 
   (	"ID" NUMBER(*,0), 
	"USER_NAME" VARCHAR2(50 BYTE), 
	"DISPLAY_NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into C###ALLEN.AUDIT_STUDENT
SET DEFINE OFF;
Insert into C###ALLEN.AUDIT_STUDENT (NEW_NAME,OLD_NAME,USER_NAME,ENTRY_DATE,OPERATION) values ('Tom Liu',null,'C###ALLEN','26/DEC/2020 10:38:32','Insert');
Insert into C###ALLEN.AUDIT_STUDENT (NEW_NAME,OLD_NAME,USER_NAME,ENTRY_DATE,OPERATION) values ('Richard Zhou','Richard Liu','C###ALLEN','26/DEC/2020 10:40:48','Update');
REM INSERTING into C###ALLEN.LIBRARY_USER
SET DEFINE OFF;
Insert into C###ALLEN.LIBRARY_USER (ID,USER_NAME,DISPLAY_NAME) values (131,'allenli','Allen Li');
Insert into C###ALLEN.LIBRARY_USER (ID,USER_NAME,DISPLAY_NAME) values (2,'allenli','Allen Li');
Insert into C###ALLEN.LIBRARY_USER (ID,USER_NAME,DISPLAY_NAME) values (3,'allenli','Allen Li');
Insert into C###ALLEN.LIBRARY_USER (ID,USER_NAME,DISPLAY_NAME) values (4,'allenli','Allen Li');
Insert into C###ALLEN.LIBRARY_USER (ID,USER_NAME,DISPLAY_NAME) values (5,'allenli','Allen Li');
Insert into C###ALLEN.LIBRARY_USER (ID,USER_NAME,DISPLAY_NAME) values (6,'allenli','Allen Li');
Insert into C###ALLEN.LIBRARY_USER (ID,USER_NAME,DISPLAY_NAME) values (7,'allenli','Allen Li');
REM INSERTING into C###ALLEN.STUDENT
SET DEFINE OFF;
Insert into C###ALLEN.STUDENT (ID,USER_NAME,DISPLAY_NAME) values (101,'allenli','Allen Li');
Insert into C###ALLEN.STUDENT (ID,USER_NAME,DISPLAY_NAME) values (102,'calvinliu','Calvin Liu');
Insert into C###ALLEN.STUDENT (ID,USER_NAME,DISPLAY_NAME) values (103,'cedric','Cedric');
Insert into C###ALLEN.STUDENT (ID,USER_NAME,DISPLAY_NAME) values (104,'aleaxliu','Alex Liu');
Insert into C###ALLEN.STUDENT (ID,USER_NAME,DISPLAY_NAME) values (105,'richard','Richard Zhou');
Insert into C###ALLEN.STUDENT (ID,USER_NAME,DISPLAY_NAME) values (106,'tomliu','Tom Liu');
--------------------------------------------------------
--  DDL for Trigger STUDENT_INSERTED
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C###ALLEN"."STUDENT_INSERTED" 
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
/
ALTER TRIGGER "C###ALLEN"."STUDENT_INSERTED" ENABLE;
--------------------------------------------------------
--  Constraints for Table STUDENT
--------------------------------------------------------

  ALTER TABLE "C###ALLEN"."STUDENT" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C###ALLEN"."STUDENT" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LIBRARY_USER
--------------------------------------------------------

  ALTER TABLE "C###ALLEN"."LIBRARY_USER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C###ALLEN"."LIBRARY_USER" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
