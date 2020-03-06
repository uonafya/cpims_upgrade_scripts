INSERT INTO ovc_cluster (id , cluster_name, created_at, is_void ,created_by_id)
(SELECT id , cluster_name, created_at, is_void ,created_by_id FROM
    dblink('dbname=cpims_dcs', 'select id , cluster_name, created_at, is_void ,created_by_id FROM ovc_cluster')
AS t(id uuid, cluster_name varchar, created_at timestamp, is_void boolean,created_by_id integer)
);

--working fine


----ovc_cluster_cbo

INSERT INTO ovc_cluster_cbo (id , added_at, is_void, cbo_id ,cluster_id)
(SELECT id , added_at, is_void, cbo_id ,cluster_id FROM
    dblink('dbname=cpims_dcs', 'select id , added_at, is_void, cbo_id ,cluster_id FROM ovc_cluster_cbo')
AS t(id uuid, added_at  timestamp, is_void boolean, cbo_id integer,cluster_id uuid)
);
---working fine


---ovc_discharge_followup

INSERT INTO ovc_discharge_followup (discharge_followup_id , type_of_discharge, date_of_discharge, discharge_destination , reason_of_discharge, expected_return_date , actual_return_date , discharge_comments, created_by,timestamp_created,is_void,sync_id,person_id,placement_id_id)
(SELECT discharge_followup_id , type_of_discharge, date_of_discharge, discharge_destination , reason_of_discharge, expected_return_date , actual_return_date , discharge_comments, created_by,timestamp_created,is_void,sync_id,person_id,placement_id_id FROM
    dblink('dbname=cpims_dcs', 'select discharge_followup_id , type_of_discharge, date_of_discharge, discharge_destination , reason_of_discharge, expected_return_date , actual_return_date , discharge_comments, created_by,timestamp_created,is_void,sync_id,person_id,placement_id_id FROM ovc_discharge_followup')
AS t(discharge_followup_id uuid, type_of_discharge varchar, date_of_discharge date, discharge_destination varchar, reason_of_discharge varchar, expected_return_date date, actual_return_date date, discharge_comments varchar, created_by integer,timestamp_created timestamp,is_void boolean,sync_id uuid,person_id integer,placement_id_id uuid)
);

--working fine

---school_list

INSERT INTO school_list (school_id, school_name , type_of_school, timestamp_created, is_void , created_by, school_subcounty_id , school_ward_id )
(SELECT school_id, school_name , type_of_school, timestamp_created, is_void , created_by, school_subcounty_id , school_ward_id  FROM
   dblink('dbname=cpims_dcs', 'select school_id, school_name , type_of_school, timestamp_created, is_void , created_by, school_subcounty_id , school_ward_id  FROM school_list')
AS t(school_id uuid, school_name varchar, type_of_school varchar, timestamp_created  timestamp, is_void boolean, created_by integer, school_subcounty_id integer, school_ward_id integer)
);

---working fine


----ovc_education_followup

INSERT INTO ovc_education_followup (education_followup_id , admitted_to_school, admission_to_school_date,education_comments,not_in_school_reason,school_admission_type,created_by,timestamp_created,is_void,sync_id,person_id,placement_id_id,school_id_id)
(SELECT education_followup_id , admitted_to_school, admission_to_school_date,education_comments,not_in_school_reason,school_admission_type,created_by,timestamp_created,is_void,sync_id,person_id,placement_id_id,school_id_id FROM
    dblink('dbname=cpims_dcs', 'select education_followup_id , admitted_to_school, admission_to_school_date,education_comments,not_in_school_reason,school_admission_type,created_by,timestamp_created,is_void,sync_id,person_id,placement_id_id,school_id_id FROM ovc_education_followup')
AS t(education_followup_id uuid, admitted_to_school varchar, admission_to_school_date date,education_comments varchar,not_in_school_reason varchar,school_admission_type varchar,created_by integer,timestamp_created timestamp,is_void boolean,sync_id uuid,person_id integer,placement_id_id uuid,school_id_id uuid)
);



----working fine


---ovc_education_level_followup

INSERT INTO ovc_education_level_followup (id , admission_level, admission_sublevel,timestamp_created,is_void,sync_id,education_followup_id_id)
(SELECT id , admission_level, admission_sublevel,timestamp_created,is_void,sync_id,education_followup_id_id FROM
    dblink('dbname=cpims_dcs', 'select id , admission_level, admission_sublevel,timestamp_created,is_void,sync_id,education_followup_id_id FROM ovc_education_level_followup')
AS t(id integer, admission_level varchar, admission_sublevel varchar,timestamp_created timestamp,is_void boolean,sync_id uuid,education_followup_id_id uuid)
);


---working fine

--ovc_family_care



INSERT INTO ovc_family_care (familycare_id , type_of_care, certificate_number, date_of_certificate_expiry ,type_of_adoption, adoption_country, date_of_adoption, court_name, court_file_number, parental_status, contact_person, adopting_mother_firstname, adopting_mother_surname, adopting_mother_othernames, adopting_mother_idnumber, adopting_mother_contacts, adopting_father_firstname, adopting_father_surname, adopting_father_othernames, adopting_father_idnumber, adopting_father_contacts, adopting_agency, adoption_remarks, created_by, timestamp_created, is_void, sync_id, adoption_subcounty_id, children_office_id, fostered_from_id, person_id, residential_institution_name_id)
(SELECT familycare_id , type_of_care, certificate_number, date_of_certificate_expiry ,type_of_adoption, adoption_country, date_of_adoption, court_name, court_file_number, parental_status, contact_person, adopting_mother_firstname, adopting_mother_surname, adopting_mother_othernames, adopting_mother_idnumber, adopting_mother_contacts, adopting_father_firstname, adopting_father_surname, adopting_father_othernames, adopting_father_idnumber, adopting_father_contacts, adopting_agency, adoption_remarks, created_by, timestamp_created, is_void, sync_id, adoption_subcounty_id, children_office_id, fostered_from_id, person_id, residential_institution_name_id FROM
dblink('dbname=cpims_dcs', 'select familycare_id , type_of_care, certificate_number, date_of_certificate_expiry ,type_of_adoption, adoption_country, date_of_adoption, court_name, court_file_number, parental_status, contact_person, adopting_mother_firstname, adopting_mother_surname, adopting_mother_othernames, adopting_mother_idnumber, adopting_mother_contacts, adopting_father_firstname, adopting_father_surname, adopting_father_othernames, adopting_father_idnumber, adopting_father_contacts, adopting_agency, adoption_remarks, created_by, timestamp_created, is_void, sync_id, adoption_subcounty_id, children_office_id, fostered_from_id, person_id, residential_institution_name_id FROM ovc_family_care')
AS t(familycare_id uuid, type_of_care varchar, certificate_number varchar, date_of_certificate_expiry date,type_of_adoption varchar, adoption_country varchar, date_of_adoption date, court_name varchar, court_file_number  varchar, parental_status varchar, contact_person varchar, adopting_mother_firstname varchar, adopting_mother_surname varchar, adopting_mother_othernames varchar, adopting_mother_idnumber varchar, adopting_mother_contacts varchar, adopting_father_firstname varchar, adopting_father_surname varchar, adopting_father_othernames varchar, adopting_father_idnumber varchar, adopting_father_contacts varchar, adopting_agency varchar, adoption_remarks varchar, created_by integer, timestamp_created timestamp, is_void boolean, sync_id uuid, adoption_subcounty_id integer, children_office_id integer, fostered_from_id integer, person_id integer, residential_institution_name_id integer)
);

---working fine


---ovc_family_status

INSERT INTO ovc_family_status (id , family_status, timestamp_created, is_void , sync_id,case_id_id,person_id)
(SELECT id , family_status, timestamp_created, is_void , sync_id,case_id_id,person_id FROM
    dblink('dbname=cpims_dcs', 'select id , family_status, timestamp_created, is_void , sync_id,case_id_id,person_id FROM ovc_family_status')
AS t(id integer, family_status varchar, timestamp_created timestamp, is_void boolean, sync_id uuid,case_id_id uuid,person_id integer)
);


--working fine

---ovc_friends
INSERT INTO ovc_friends (id, friend_firstname, friend_other_names, friend_surname, timestamp_created, is_void, sync_id,case_id_id,person_id)
(SELECT id, friend_firstname, friend_other_names, friend_surname, timestamp_created, is_void, sync_id,case_id_id,person_id FROM 
    dblink('dbname=cpims_dcs', 'select id, friend_firstname, friend_other_names, friend_surname, timestamp_created, is_void, sync_id,case_id_id,person_id from ovc_friends')
AS t(id int, friend_firstname varchar, friend_other_names varchar, friend_surname varchar, timestamp_created date, is_void bool, sync_id uuid,case_id_id uuid,person_id int)
);

--working fine

--ovc_hobbies
INSERT INTO ovc_hobbies (id, hobby, timestamp_created,is_void,sync_id,case_id_id,person_id)
(select id, hobby, timestamp_created,is_void,sync_id,case_id_id,person_id FROM
    dblink('dbname=cpims_dcs', 'select id, hobby, timestamp_created,is_void,sync_id,case_id_id,person_id FROM ovc_hobbies')
AS t(id int4,hobby varchar, timestamp_created timestamp,is_void boolean,sync_id uuid,case_id_id uuid,person_id integer)
);

--working fine

----ovc_medical

INSERT INTO ovc_medical (medical_id , mental_condition, physical_condition, other_condition , timestamp_created, is_void , sync_id , case_id_id, person_id)
(SELECT medical_id , mental_condition, physical_condition, other_condition , timestamp_created, is_void , sync_id , case_id_id, person_id FROM
    dblink('dbname=cpims_dcs', 'select medical_id , mental_condition, physical_condition, other_condition , timestamp_created, is_void , sync_id , case_id_id, person_id FROM ovc_medical')
AS t(medical_id uuid, mental_condition varchar, physical_condition varchar, other_condition varchar, timestamp_created timestamp, is_void boolean, sync_id uuid, case_id_id uuid, person_id integer)
);

--working fine

---ovc_medical_subconditions


INSERT INTO ovc_medical_subconditions (medicalsubcond_id , medical_condition, medical_subcondition, timestamp_created , is_void,sync_id,medical_id_id,person_id)
(SELECT medicalsubcond_id , medical_condition, medical_subcondition, timestamp_created , is_void,sync_id,medical_id_id,person_id FROM
    dblink('dbname=cpims_dcs', 'select medicalsubcond_id , medical_condition, medical_subcondition, timestamp_created , is_void,sync_id,medical_id_id,person_id FROM ovc_medical_subconditions')
AS t(medicalsubcond_id uuid, medical_condition varchar, medical_subcondition varchar, timestamp_created timestamp, is_void boolean,sync_id uuid,medical_id_id uuid,person_id integer)
);

---working fine



----ovc_placement_followup

INSERT INTO ovc_placement_followup (placememt_followup_id , followup_type, followup_date,followup_details,followup_outcome,created_by,timestamp_created,is_void,sync_id,person_id,placement_id_id)
(SELECT placememt_followup_id , followup_type, followup_date,followup_details,followup_outcome,created_by,timestamp_created,is_void,sync_id,person_id,placement_id_id FROM
    dblink('dbname=cpims_dcs', 'select placememt_followup_id , followup_type, followup_date,followup_details,followup_outcome,created_by,timestamp_created,is_void,sync_id,person_id,placement_id_id FROM ovc_placement_followup')
AS t(placememt_followup_id uuid, followup_type varchar, followup_date date,followup_details varchar,followup_outcome varchar,created_by integer,timestamp_created timestamp,is_void boolean,sync_id uuid,person_id integer,placement_id_id uuid)
);

---working fine



---working fine


--ovc_needs

INSERT INTO ovc_needs (id, need_description, need_type, timestamp_created, is_void, sync_id, case_id_id, person_id)
(SELECT id, need_description, need_type, timestamp_created, is_void, sync_id, case_id_id, person_id FROM 
    dblink('dbname=cpims_dcs', 'select id, need_description, need_type, timestamp_created, is_void, sync_id, case_id_id, person_id from ovc_needs')
AS t(id int, need_description varchar, need_type varchar, timestamp_created date, is_void bool, sync_id uuid, case_id_id uuid, person_id int)
);


--working fine


----ovc_referrals

INSERT INTO ovc_referrals (refferal_id , refferal_actor_type, refferal_actor_specify, refferal_to , refferal_status, refferal_startdate , refferal_enddate , referral_grouping_id, timestamp_created , is_void, sync_id,case_category_id,case_id_id,person_id)
(SELECT refferal_id , refferal_actor_type, refferal_actor_specify, refferal_to , refferal_status, refferal_startdate , refferal_enddate , referral_grouping_id, timestamp_created , is_void, sync_id,case_category_id,case_id_id,person_id FROM
    dblink('dbname=cpims_dcs', 'select refferal_id , refferal_actor_type, refferal_actor_specify, refferal_to , refferal_status, refferal_startdate , refferal_enddate , referral_grouping_id, timestamp_created , is_void, sync_id,case_category_id,case_id_id,person_id FROM ovc_referrals')
AS t(refferal_id uuid, refferal_actor_type varchar, refferal_actor_specify varchar, refferal_to varchar, refferal_status varchar, refferal_startdate date, refferal_enddate date, referral_grouping_id uuid, timestamp_created timestamp, is_void boolean, sync_id uuid,case_category_id uuid,case_id_id uuid,person_id integer)
);
