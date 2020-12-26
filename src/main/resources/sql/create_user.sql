CREATE USER c###allen IDENTIFIED BY admin
  DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
  QUOTA 20M on users
  ACCOUNT UNLOCK;


GRANT create session TO c###allen;
GRANT create table TO c###allen;
GRANT create view TO c###allen;
GRANT create any trigger TO c###allen;
GRANT create any procedure TO c###allen;
GRANT create sequence TO c###allen;
GRANT create synonym TO c###allen;