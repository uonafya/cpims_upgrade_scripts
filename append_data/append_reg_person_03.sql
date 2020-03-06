-----reg_person_master
INSERT INTO reg_person_master (id, person_type, system_id, timestamp_created, person_id)
(SELECT id, person_type, system_id, timestamp_created, person_id FROM
    dblink('dbname=cpims_dcs', 'select id , person_type, system_id, timestamp_created, person_id FROM reg_person_master')
AS t(id uuid,person_type varchar,system_id varchar,timestamp_created date, person_id int4)
);


---working fine

-----reg_persons_guardians

INSERT INTO reg_persons_guardians (relationship , date_linked, date_delinked, child_headed, is_void , child_person_id, guardian_person_id)
(SELECT relationship , date_linked, date_delinked, child_headed, is_void , child_person_id, guardian_person_id FROM
    dblink('dbname=cpims_dcs', 'select relationship , date_linked, date_delinked, child_headed, is_void , child_person_id, guardian_person_id FROM reg_persons_guardians')
AS t(relationship varchar, date_linked date , date_delinked date, child_headed bool, is_void bool, child_person_id int, guardian_person_id int)
);


--working fine

----reg_persons_siblings

INSERT INTO reg_persons_siblings (date_linked, date_delinked, remarks, is_void , child_person_id, sibling_person_id)
(SELECT date_linked, date_delinked, remarks, is_void , child_person_id, sibling_person_id FROM
    dblink('dbname=cpims_dcs', 'select date_linked, date_delinked, remarks, is_void , child_person_id, sibling_person_id FROM reg_persons_siblings')
AS t(date_linked date , date_delinked date,remarks varchar, is_void bool, child_person_id int, sibling_person_id int)
);
--working fine

----reg_persons_types

INSERT INTO reg_persons_types (person_type_id, date_began, date_ended , is_void,person_id)
(SELECT person_type_id, date_began, date_ended , is_void,person_id FROM
    dblink('dbname=cpims_dcs', 'select person_type_id, date_began, date_ended , is_void,person_id FROM reg_persons_types')
AS t(person_type_id varchar, date_began date, date_ended date, is_void boolean,person_id integer)
);
