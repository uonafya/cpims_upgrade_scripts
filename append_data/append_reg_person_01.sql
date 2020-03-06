
create extension dblink;
INSERT INTO reg_person (id, designation , first_name , other_names , surname , email, des_phone_number , date_of_birth , date_of_death , sex_id , is_void ,created_at , created_by_id )
(SELECT id, designation , first_name , other_names , surname , email, des_phone_number , date_of_birth , date_of_death , sex_id , is_void ,created_at , created_by_id FROM
    dblink('dbname=cpims_dcs', 'select id, designation , first_name , other_names , surname , email, des_phone_number , date_of_birth , date_of_death , sex_id , is_void ,created_at , 1 from reg_person where id > 1')
AS t(id int4, designation varchar , first_name varchar , other_names varchar , surname varchar , email varchar, des_phone_number int4 , date_of_birth date, date_of_death date, sex_id varchar , is_void bool, created_at date, created_by_id int4)

);