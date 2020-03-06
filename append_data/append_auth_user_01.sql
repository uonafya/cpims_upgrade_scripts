--------------auth_user--------

INSERT INTO auth_user (id, "password", last_login, is_superuser, "role", username, is_staff, is_active, timestamp_created, timestamp_updated, password_changed_timestamp, reg_person_id )
(SELECT id, "password", last_login, is_superuser, "role", CONCAT (username,'_01',NULL) as username, is_staff, is_active, timestamp_created, timestamp_updated, password_changed_timestamp, reg_person_id  FROM
    dblink('dbname=cmimdb', 'select id, "password", last_login, is_superuser, "role", CONCAT(username, ''_01'', NULL) as username, is_staff, is_active, timestamp_created, timestamp_updated, password_changed_timestamp, reg_person_id from auth_user where reg_person_id > 1')
AS t( id int4, "password" varchar, last_login date, is_superuser bool, "role" varchar, username varchar, is_staff bool, is_active bool, timestamp_created date, timestamp_updated date, password_changed_timestamp date, reg_person_id int4));


----Duplicates on username during the move. Created a hack for this by adding a suffix on usernames from DCS before moving the data. worked fine
