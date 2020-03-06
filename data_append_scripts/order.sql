

-- Reg_person table

create extension dblink;
INSERT INTO reg_person (id, designation , first_name , other_names , surname , email, des_phone_number , date_of_birth , date_of_death , sex_id , is_void ,created_at , created_by_id )
(SELECT id, designation , first_name , other_names , surname , email, des_phone_number , date_of_birth , date_of_death , sex_id , is_void ,created_at , created_by_id FROM
    dblink('dbname=cpims_dcs', 'select id, designation , first_name , other_names , surname , email, des_phone_number , date_of_birth , date_of_death , sex_id , is_void ,created_at , 1 from reg_person where id > 1')
AS t(id int4, designation varchar , first_name varchar , other_names varchar , surname varchar , email varchar, des_phone_number int4 , date_of_birth date, date_of_death date, sex_id varchar , is_void bool, created_at date, created_by_id int4)

);


-- Run successfully on new DB
---created by defaulted to 1
-- Also note that this query defaults created by to 1 and you have to delete record 2-48 from OVC DB

--------------auth_user--------

INSERT INTO auth_user (id, "password", last_login, is_superuser, "role", username, is_staff, is_active, timestamp_created, timestamp_updated, password_changed_timestamp, reg_person_id )
(SELECT id, "password", last_login, is_superuser, "role", username, is_staff, is_active, timestamp_created, timestamp_updated, password_changed_timestamp, reg_person_id  FROM
    dblink('dbname=cpims_dcs', 'select id, "password", last_login, is_superuser, "role", username, is_staff, is_active, timestamp_created, timestamp_updated, password_changed_timestamp, reg_person_id from auth_user where reg_person_id > 1' )
AS t( id int4, "password" varchar, last_login date, is_superuser bool, "role" varchar, username varchar, is_staff bool, is_active bool, timestamp_created date, timestamp_updated date, password_changed_timestamp date, reg_person_id int4) 
);
----Duplicates on username during the move. Created a hack for this by adding a suffix on usernames from DCS before moving the data. worked fine
----Important to note that DCS database has a suffix on the usernames

---------reg_org_unit----


INSERT INTO reg_org_unit ( id, org_unit_id_vis, org_unit_name, org_unit_type_id , date_operational,date_closed,handle_ovc,is_void,parent_org_unit_id,created_at, created_by_id)
(SELECT id, org_unit_id_vis, org_unit_name, org_unit_type_id , date_operational,date_closed,handle_ovc,is_void,parent_org_unit_id,created_at, created_by_id FROM
    dblink('dbname=cpims_dcs', 'select id, org_unit_id_vis, org_unit_name, org_unit_type_id , date_operational,date_closed,handle_ovc,is_void,parent_org_unit_id,created_at, created_by_id FROM reg_org_unit where id > 2')
AS t(id int4,org_unit_id_vis varchar, org_unit_name varchar, org_unit_type_id varchar, date_operational date,date_closed date,handle_ovc boolean,is_void boolean,parent_org_unit_id integer,created_at date, created_by_id integer)
);

---working fine



------reg_org_units_geo

INSERT INTO reg_org_units_geo (date_linked, date_delinked, is_void, area_id, org_unit_id)
(SELECT date_linked, date_delinked, is_void, area_id, org_unit_id FROM
    dblink('dbname=cpims_dcs user=postgres password=', 'select date_linked, date_delinked, is_void, area_id, org_unit_id FROM reg_org_units_geo where org_unit_id>2')
AS t(date_linked date,date_delinked date,is_void bool,area_id int4, org_unit_id int4));

---working fine



-----reg_person_geo

INSERT INTO reg_persons_geo ( area_type, date_linked,date_delinked,is_void,area_id,person_id)
(SELECT area_type, date_linked,date_delinked,is_void,area_id,person_id FROM
    dblink('dbname=cpims_dcs', 'select area_type, date_linked,date_delinked,is_void,area_id,person_id FROM reg_persons_geo')
AS t(area_type varchar, date_linked date,date_delinked date,is_void bool,area_id int4,person_id int4)
);
--working fine

------------reg_persons_org_units
 INSERT INTO reg_persons_org_units ( date_linked, date_delinked, primary_unit, reg_assistant, is_void, org_unit_id, person_id)
     (SELECT date_linked, date_delinked, primary_unit, reg_assistant, is_void, org_unit_id, person_id FROM
             dblink('dbname=cpims_dcs ', 'select date_linked, date_delinked, primary_unit, reg_assistant, is_void, org_unit_id, person_id from reg_persons_org_units')
     AS t(date_linked date, date_delinked date, primary_unit bool, reg_assistant bool,is_void bool,  org_unit_id int4, person_id int4)
);
--working fine

---reg_persons_external_ids

INSERT INTO reg_persons_external_ids (identifier_type_id, identifier, is_void, person_id)
(SELECT identifier_type_id, identifier, is_void, person_id FROM
dblink('dbname=cpims_dcs', 'select identifier_type_id, identifier, is_void, person_id FROM reg_persons_external_ids') AS t(identifier_type_id varchar, identifier varchar, is_void bool, person_id int4));

--working fine

---reg_persons_audit_trail

INSERT INTO reg_persons_audit_trail (transaction_type_id, interface_id, date_recorded_paper, timestamp_modified, ip_address, meta_data, app_user_id, person_id, person_recorded_paper_id)
(SELECT transaction_type_id, interface_id, date_recorded_paper, timestamp_modified, ip_address, meta_data, app_user_id, person_id, person_recorded_paper_id FROM
dblink('dbname=cpims_dcs', 'select transaction_type_id, interface_id, date_recorded_paper, timestamp_modified, ip_address, meta_data, app_user_id, person_id, person_recorded_paper_id FROM reg_persons_audit_trail') AS t(transaction_type_id varchar, interface_id varchar, date_recorded_paper date, timestamp_modified timestamptz, ip_address inet, meta_data text, app_user_id int4, person_id int4, person_recorded_paper_id int4));

--working fine

----reg_org_units_audit_trail
INSERT INTO reg_org_units_audit_trail (transaction_type_id, interface_id, timestamp_modified , ip_address,meta_data,app_user_id,org_unit_id)
(SELECT  transaction_type_id, interface_id, timestamp_modified , ip_address,meta_data,app_user_id,org_unit_id FROM
    dblink('dbname=cpims_dcs', 'select transaction_type_id, interface_id, timestamp_modified , ip_address,meta_data,app_user_id,org_unit_id FROM reg_org_units_audit_trail')
AS t(transaction_type_id varchar, interface_id varchar, timestamp_modified timestamp, ip_address inet,meta_data text,app_user_id integer,org_unit_id integer)
);

---working fine

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


--working fine

---------------ovc_case_record-----------

INSERT INTO ovc_case_record (case_id,case_serial, perpetrator_status, perpetrator_first_name,  perpetrator_other_names,perpetrator_surname,perpetrator_relationship_type,risk_level, date_case_opened,case_reporter_first_name,case_reporter_other_names, case_reporter_surname,case_reporter_contacts, case_reporter, court_name, court_number, police_station,ob_number,case_status, referral_present,timestamp_created, is_void, sync_id, parent_case_id, created_by, case_remarks, date_of_summon, summon_status, person_id)
(SELECT case_id,case_serial, perpetrator_status, perpetrator_first_name,  perpetrator_other_names,perpetrator_surname,perpetrator_relationship_type,risk_level, date_case_opened,case_reporter_first_name,case_reporter_other_names, case_reporter_surname,case_reporter_contacts, case_reporter, court_name, court_number, police_station,ob_number,case_status, referral_present,timestamp_created, is_void, sync_id, parent_case_id, created_by, case_remarks, date_of_summon, summon_status, person_id FROM
    dblink('dbname=cpims_dcs', 'select case_id,case_serial, perpetrator_status, perpetrator_first_name,  perpetrator_other_names,perpetrator_surname,perpetrator_relationship_type,risk_level, date_case_opened,case_reporter_first_name,case_reporter_other_names, case_reporter_surname,case_reporter_contacts, case_reporter, court_name, court_number, police_station,ob_number,case_status, referral_present,timestamp_created, is_void, sync_id, parent_case_id, created_by, case_remarks, date_of_summon, summon_status, person_id from ovc_case_record')
AS t(case_id uuid,case_serial varchar, perpetrator_status varchar, perpetrator_first_name varchar,  perpetrator_other_names varchar,perpetrator_surname varchar,perpetrator_relationship_type varchar,risk_level varchar, date_case_opened date,case_reporter_first_name varchar,case_reporter_other_names varchar, case_reporter_surname varchar,case_reporter_contacts varchar, case_reporter varchar, court_name varchar, court_number varchar, police_station varchar,ob_number varchar,case_status varchar, referral_present varchar,timestamp_created date, is_void bool, sync_id uuid, parent_case_id uuid, created_by int, case_remarks varchar, date_of_summon date, summon_status bool, person_id int)
);

---working fine


--------------OVC_case_category


INSERT INTO ovc_case_category ( case_category_id , case_category , case_grouping_id , date_of_event , place_of_event , case_nature , timestamp_created , is_void ,sync_id , case_id_id , person_id )
(SELECT case_category_id , case_category , case_grouping_id , date_of_event , place_of_event , case_nature , timestamp_created , is_void ,sync_id , case_id_id , person_id FROM    dblink('dbname=cpims_dcs', 'select case_category_id , case_category , case_grouping_id , date_of_event , place_of_event , case_nature , timestamp_created , is_void ,sync_id , case_id_id , person_id FROM ovc_case_category')
AS t(case_category_id uuid, case_category varchar , case_grouping_id uuid , date_of_event date , place_of_event varchar , case_nature varchar, timestamp_created date, is_void bool ,sync_id uuid , case_id_id uuid, person_id int4));

---working fine


-----ovc_case_geo

INSERT INTO ovc_case_geo (id, report_ward, report_village, occurence_ward, occurence_village, timestamp_created, is_void, sync_id, case_id_id, occurence_county_id, occurence_subcounty_id, person_id, report_orgunit_id, report_subcounty_id )
(SELECT id, report_ward, report_village, occurence_ward, occurence_village, timestamp_created, is_void, sync_id, case_id_id, occurence_county_id, occurence_subcounty_id, person_id, report_orgunit_id, report_subcounty_id FROM
    dblink('dbname=cpims_dcs', 'select id, report_ward, report_village, occurence_ward, occurence_village, timestamp_created, is_void, sync_id, case_id_id, occurence_county_id, occurence_subcounty_id, person_id, report_orgunit_id, report_subcounty_id FROM ovc_case_geo')
AS t( id int, report_ward varchar, report_village varchar, occurence_ward varchar, occurence_village varchar, timestamp_created date, is_void bool, sync_id uuid, case_id_id uuid, occurence_county_id int4, occurence_subcounty_id int4, person_id int4, report_orgunit_id int4, report_subcounty_id int4));

-------ovc_placement

INSERT INTO ovc_placement (placement_id,residential_institution_name , admission_date, admission_type, transfer_from , admission_reason, holding_period , committing_period_units,committing_period,current_residential_status, has_court_committal_order,free_for_adoption,court_order_number, court_order_issue_date, committing_court, placement_notes, ob_number,placement_type,created_by,is_active,timestamp_created,is_void, sync_id,person_id)
(SELECT placement_id,residential_institution_name , admission_date, admission_type, transfer_from , admission_reason, holding_period , committing_period_units,committing_period,current_residential_status, has_court_committal_order,free_for_adoption,court_order_number, court_order_issue_date, committing_court, placement_notes, ob_number,placement_type,created_by,is_active,timestamp_created,is_void, sync_id,person_id  FROM
    dblink('dbname=cpims_dcs', 'select placement_id,residential_institution_name , admission_date, admission_type, transfer_from , admission_reason, holding_period , committing_period_units,committing_period,current_residential_status, has_court_committal_order,free_for_adoption,court_order_number, court_order_issue_date, committing_court, placement_notes, ob_number,placement_type,created_by,is_active,timestamp_created,is_void, sync_id,person_id  FROM ovc_placement')
AS t(placement_id uuid,residential_institution_name varchar, admission_date date, admission_type varchar, transfer_from varchar, admission_reason varchar, holding_period integer, committing_period_units varchar,committing_period integer,current_residential_status varchar, has_court_committal_order varchar,free_for_adoption varchar,court_order_number varchar, court_order_issue_date date, committing_court varchar, placement_notes varchar, ob_number varchar,placement_type varchar,created_by integer,is_active boolean,timestamp_created timestamp,is_void boolean, sync_id uuid,person_id integer)
);

---working fine

-----ovc_case_events
INSERT INTO ovc_case_events(case_event_id, case_event_type_id, date_of_event, case_event_details, case_event_notes, case_event_outcome, next_hearing_date, next_mention_date, 
plea_taken, application_outcome, timestamp_created, is_void, sync_id, app_user_id, case_id_id, placement_id_id )
(SELECT case_event_id, case_event_type_id, date_of_event, case_event_details, case_event_notes, case_event_outcome, next_hearing_date, next_mention_date, 
plea_taken, application_outcome, timestamp_created, is_void, sync_id, app_user_id, case_id_id, placement_id_id FROM
    dblink('dbname=cpims_dcs', 'select case_event_id, case_event_type_id, date_of_event, case_event_details, case_event_notes, case_event_outcome, next_hearing_date, next_mention_date, 
plea_taken, application_outcome, timestamp_created, is_void, sync_id, app_user_id, case_id_id, placement_id_id from ovc_case_events')
AS t( case_event_id uuid, case_event_type_id varchar, date_of_event date, case_event_details varchar, case_event_notes varchar, case_event_outcome varchar, next_hearing_date date, next_mention_date date, 
plea_taken varchar, application_outcome varchar, timestamp_created date, is_void bool, sync_id uuid, app_user_id int4, case_id_id uuid, placement_id_id uuid));

----working fine

-------ovc_case_event_closure

INSERT INTO ovc_case_event_closure (closure_id, case_outcome, date_of_case_closure, case_closure_notes, created_by, timestamp_created, is_void, is_active, sync_id, case_event_id_id, transfer_to_id)
(SELECT closure_id, case_outcome, date_of_case_closure, case_closure_notes, created_by, timestamp_created, is_void, is_active, sync_id, case_event_id_id, transfer_to_id FROM
    dblink('dbname=cpims_dcs', 'select closure_id, case_outcome, date_of_case_closure, case_closure_notes, created_by, timestamp_created, is_void, is_active, sync_id, case_event_id_id, transfer_to_id FROM ovc_case_event_closure') AS t(closure_id uuid, case_outcome varchar, date_of_case_closure date, case_closure_notes varchar, created_by int4, timestamp_created timestamptz, is_void bool, is_active bool, sync_id uuid, case_event_id_id uuid, transfer_to_id int4));

----working fine

---ovc_case_event_court

INSERT INTO ovc_case_event_court (court_session_id , court_order, timestamp_created, is_void , sync_id, case_category_id , case_event_id_id)
(SELECT court_session_id , court_order, timestamp_created, is_void , sync_id, case_category_id , case_event_id_id FROM
    dblink('dbname=cpims_dcs', 'select court_session_id , court_order, timestamp_created, is_void , sync_id, case_category_id , case_event_id_id FROM ovc_case_event_court')
AS t(court_session_id uuid, court_order varchar, timestamp_created timestamp, is_void boolean, sync_id uuid, case_category_id uuid, case_event_id_id uuid)
);

---working fine


----ovc_case_event_encounters

INSERT INTO ovc_case_event_encounters (service_id, service_provided, service_provider, place_of_service, date_of_encounter_event, service_grouping_id, timestamp_created, is_void, sync_id, case_category_id,case_event_id_id)
(SELECT service_id, service_provided, service_provider, place_of_service, date_of_encounter_event, service_grouping_id, timestamp_created, is_void, sync_id, case_category_id,case_event_id_id FROM 
    dblink('dbname=cpims_dcs', 'select service_id, service_provided, service_provider, place_of_service, date_of_encounter_event, service_grouping_id, timestamp_created, is_void, sync_id, case_category_id,case_event_id_id from ovc_case_event_encounters')
AS t(service_id uuid, service_provided varchar, service_provider varchar, place_of_service varchar, date_of_encounter_event date, service_grouping_id uuid, timestamp_created date, is_void bool, sync_id uuid, case_category_id uuid,case_event_id_id uuid)
);

---working fine

---ovc_case_event_summon

INSERT INTO ovc_case_event_summon (summon_id , honoured, honoured_date, summon_date , summon_note, timestamp_created , is_void, sync_id, case_category_id, case_event_id_id)
(SELECT summon_id , honoured, honoured_date, summon_date , summon_note, timestamp_created , is_void, sync_id, case_category_id, case_event_id_id FROM
    dblink('dbname=cpims_dcs', 'select summon_id , honoured, honoured_date, summon_date , summon_note, timestamp_created , is_void, sync_id, case_category_id, case_event_id_id FROM ovc_case_event_summon')
AS t(summon_id uuid, honoured boolean, honoured_date date, summon_date date, summon_note varchar, timestamp_created timestamp, is_void boolean, sync_id uuid, case_category_id uuid, case_event_id_id uuid)
);

---working fine

-----ovc_case_sub_category

INSERT INTO ovc_case_sub_category (case_sub_category_id, case_grouping_id, sub_category_id, timestamp_created, is_void, sync_id, case_category_id, person_id)
(SELECT case_sub_category_id, case_grouping_id, sub_category_id, timestamp_created, is_void, sync_id, case_category_id, person_id FROM
dblink('dbname=cpims_dcs', 'select case_sub_category_id, case_grouping_id, sub_category_id, timestamp_created, is_void, sync_id, case_category_id, person_id FROM ovc_case_sub_category') AS t(case_sub_category_id uuid, case_grouping_id uuid, sub_category_id varchar, timestamp_created timestamptz, is_void bool, sync_id uuid, case_category_id uuid, person_id int4));

---working fine


----ovc_cluster

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

---working fine

---reg_household

INSERT INTO reg_household (id , members, is_void, timestamp_created , index_child_id)
(SELECT id , members, is_void, timestamp_created , index_child_id FROM
    dblink('dbname=cpims_dcs', 'select id , members, is_void, timestamp_created , index_child_id FROM reg_household')
AS t(id uuid, members varchar, is_void boolean, timestamp_created timestamp, index_child_id integer)
);


---working fine


----reg_org_units_contact


INSERT INTO reg_org_units_contact (contact_detail_type_id, contact_detail, is_void , org_unit_id)
(SELECT contact_detail_type_id, contact_detail, is_void , org_unit_id FROM
    dblink('dbname=cpims_dcs', 'select contact_detail_type_id, contact_detail, is_void , org_unit_id FROM reg_org_units_contact where org_unit_id>2')
AS t(contact_detail_type_id varchar, contact_detail varchar, is_void boolean, org_unit_id integer)
);

----working fine 

---reg_org_units_external_ids

INSERT INTO reg_org_units_external_ids (identifier_type_id, identifier_value, is_void, org_unit_id)
(SELECT identifier_type_id, identifier_value, is_void, org_unit_id FROM
    dblink('dbname=cpims_dcs ', 'select identifier_type_id, identifier_value, is_void, org_unit_id FROM reg_org_units_external_ids where org_unit_id>2')
AS t(identifier_type_id varchar,identifier_value varchar,is_void bool,org_unit_id int4)
);

---working fine



------auth_user_groups

INSERT INTO auth_user_groups (appuser_id , group_id )
(SELECT appuser_id , group_id FROM
    dblink('dbname=cpims_dcs', 'select appuser_id, group_id FROM auth_user_groups')
AS t(appuser_id int4, group_id int4)
);
---working fine


-----auth_user_user_permissions
INSERT INTO auth_user_user_permissions (appuser_id, permission_id)
(SELECT appuser_id, permission_id FROM
    dblink('dbname=cpims_dcs user=postgres ', 'select appuser_id, permission_id from auth_user_user_permissions')
AS t(appuser_id integer, permission_id integer)
);
---working fine

----auth_user_groups_geo_org
INSERT INTO auth_user_groups_geo_org (timestamp_modified, is_void,area_id,group_id,org_unit_id,user_id)
(SELECT timestamp_modified, is_void,area_id,group_id,org_unit_id,user_id FROM
    dblink('dbname=cpims_dcs user=postgres ', 'select timestamp_modified, is_void,area_id,group_id,org_unit_id,user_id from auth_user_groups_geo_org')
AS t(timestamp_modified timestamp, is_void boolean,area_id integer,group_id integer,org_unit_id integer,user_id integer)
);
---working fine

---django_content_type

INSERT INTO django_content_type ( app_label , model )
(SELECT app_label , model FROM
    dblink('dbname=cpims_dcs', 'select app_label, model from django_content_type')
AS t( app_label varchar , model varchar )
WHERE model NOT IN (SELECT model FROM django_content_type )
);

---working fine


-----forms_audit_trail

INSERT INTO forms_audit_trail ( transaction_id, form_id, form_type_id, transaction_type_id, interface_id, timestamp_modified, ip_address, meta_data, app_user_id )
(SELECT transaction_id, form_id, form_type_id, transaction_type_id, interface_id, timestamp_modified, ip_address, meta_data, app_user_id FROM
    dblink('dbname=cpims_dcs', 'select transaction_id, form_id, form_type_id, transaction_type_id, interface_id, timestamp_modified, ip_address, meta_data, app_user_id from forms_audit_trail')
AS t( transaction_id int4, form_id uuid, form_type_id varchar, transaction_type_id varchar, interface_id varchar, timestamp_modified date, ip_address inet, meta_data text, app_user_id int4)
);

--working fine


---form_log

INSERT INTO forms_log (form_log_id, form_type_id, form_id, timestamp_created, is_void, sync_id, timestamp_modified, app_user, person_id)
(SELECT form_log_id, form_type_id, form_id, timestamp_created, is_void, sync_id, timestamp_modified, app_user, person_id FROM
    dblink('dbname=cpims_dcs user=postgres ', 'select form_log_id, form_type_id, form_id, timestamp_created, is_void, sync_id, timestamp_modified, app_user, person_id from forms_log')
AS t(form_log_id uuid, form_type_id varchar, form_id varchar, timestamp_created timestamp, is_void boolean, sync_id uuid, timestamp_modified timestamp, app_user int4, person_id int4)
);

---working fine


----list_general
INSERT INTO list_general (item_id , item_description, item_description_short, item_category , the_order, user_configurable , sms_keyword , is_void, field_name , timestamp_modified)
(SELECT item_id , item_description, item_description_short, item_category , the_order, user_configurable , sms_keyword , is_void, field_name , timestamp_modified FROM
    dblink('dbname=cpims_dcs', 'select item_id , item_description, item_description_short, item_category , the_order, user_configurable , sms_keyword , is_void, field_name , timestamp_modified FROM list_general')
AS t(item_id varchar, item_description varchar, item_description_short varchar , item_category varchar , the_order int4, user_configurable bool, sms_keyword bool, is_void bool, field_name varchar, timestamp_modified date)
WHERE item_id NOT IN (SELECT item_id FROM list_general) and item_description NOT IN (SELECT item_description FROM list_general)
);

---working fine



----ovc_bursaryinfo

INSERT INTO ovc_bursaryinfo (bursary_id, bursary_type, disbursement_date, amount, "year", term, timestamp_created, is_void, is_active, sync_id, created_by, person_id)
(SELECT bursary_id, bursary_type, disbursement_date, amount, "year", term, timestamp_created, is_void, is_active, sync_id, created_by, person_id  FROM
    dblink('dbname=cpims_dcs user=postgres password=admin1234', 'select bursary_id, bursary_type, disbursement_date, amount, "year", term, timestamp_created, is_void, is_active, sync_id, created_by, person_id FROM ovc_bursaryinfo')
AS t(bursary_id uuid, bursary_type varchar, disbursement_date date, amount varchar, "year" varchar, term varchar, timestamp_created timestamptz, is_void bool, is_active bool, sync_id uuid, created_by int4, person_id int4)
);
---working fine

----ovc_adverseevents_followup

INSERT INTO ovc_adverseevents_followup (adverse_condition_id , adverse_condition_description, attendance_type, referral_type , adverse_event_date, created_by , timestamp_created , is_void, sync_id , person_id, placement_id_id  )
(SELECT adverse_condition_id , adverse_condition_description, attendance_type, referral_type , adverse_event_date, created_by , timestamp_created , is_void, sync_id , person_id, placement_id_id FROM
    dblink('dbname=cpims_dcs', 'select adverse_condition_id , adverse_condition_description, attendance_type, referral_type , adverse_event_date, created_by , timestamp_created , is_void, sync_id , person_id, placement_id_id FROM ovc_adverseevents_followup')
AS t(adverse_condition_id uuid, adverse_condition_description varchar, attendance_type varchar , referral_type varchar , adverse_event_date date, created_by int, timestamp_created date, is_void bool, sync_id uuid, person_id int, placement_id_id uuid )

);
---working fine



-----ovc_adverseevents_other_followup

INSERT INTO ovc_adverseevents_other_followup (adverse_condition , timestamp_created , is_void , sync_id , adverse_condition_id_id )
(SELECT adverse_condition , timestamp_created , is_void , sync_id , adverse_condition_id_id FROM
    dblink('dbname=cpims_dcs', 'select adverse_condition , timestamp_created , is_void , sync_id , adverse_condition_id_id FROM ovc_adverseevents_other_followup')
AS t( adverse_condition varchar , timestamp_created date , is_void bool , sync_id uuid , adverse_condition_id_id uuid )

);

----working fine


---ovc_economic_status
INSERT INTO ovc_economic_status (id, household_economic_status, timestamp_created, is_void, sync_id, case_id_id, person_id)
(SELECT id, household_economic_status, timestamp_created, is_void, sync_id, case_id_id, person_id  FROM
    dblink('dbname=cpims_dcs user=postgres ', 'select id, household_economic_status, timestamp_created, is_void, sync_id, case_id_id, person_id FROM ovc_economic_status') AS t(id int4, household_economic_status varchar, timestamp_created timestamptz, is_void bool, sync_id uuid, case_id_id uuid, person_id int4)
);
---working fine
















