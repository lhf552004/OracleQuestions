CREATE TABLE library_user(
    id int not null primary key,
    user_name varchar2(50),
    display_name varchar2(50)
);

CREATE TABLE audit_student(
    new_name varchar2(50),
    old_name varchar2(50),
    user_name varchar2(50),
    entry_date varchar2(50),
    operation varchar2(50)
);