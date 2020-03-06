--------------auth_user--------

INSERT INTO auth_user (id, "password", last_login, is_superuser, "role", username, is_staff, is_active, timestamp_created, timestamp_updated, password_changed_timestamp, reg_person_id )
(SELECT id, "password", last_login, is_superuser, "role", username, is_staff, is_active, timestamp_created, timestamp_updated, password_changed_timestamp, reg_person_id  FROM
    dblink('dbname=cpims_dcs', 'select id, "password", last_login, is_superuser, "role", username, is_staff, is_active, timestamp_created, timestamp_updated, password_changed_timestamp, reg_person_id from auth_user where reg_person_id > 1 and id not in (4,11,45,47,50,51,61,83,86,88,97,100,108,119,120,129,130,133,180,201,227,230,232,236,237,246,251,258,267,296,305,357,372,376,387,407,427,431,436,437,448,449,467,481,518,522,533,536,579,588,593,600,610,617,667,724,731,762,771,780,833)' )
AS t( id int4, "password" varchar, last_login date, is_superuser bool, "role" varchar, username varchar, is_staff bool, is_active bool, timestamp_created date, timestamp_updated date, password_changed_timestamp date, reg_person_id int4) 

);
----Duplicates on username during the move. Created a hack for this by adding a suffix on usernames from DCS before moving the data. worked fine
