-- ---------------ovc_case_record-----------

-- INSERT INTO ovc_case_record (case_id,case_serial, perpetrator_status, perpetrator_first_name,  perpetrator_other_names,perpetrator_surname,perpetrator_relationship_type,risk_level, date_case_opened,case_reporter_first_name,case_reporter_other_names, case_reporter_surname,case_reporter_contacts, case_reporter, court_name, court_number, police_station,ob_number,case_status, referral_present,timestamp_created, is_void, sync_id, parent_case_id, created_by, case_remarks, date_of_summon, summon_status, person_id, case_stage)
-- (SELECT case_id,case_serial, perpetrator_status, perpetrator_first_name,  perpetrator_other_names,perpetrator_surname,perpetrator_relationship_type,risk_level, date_case_opened,case_reporter_first_name,case_reporter_other_names, case_reporter_surname,case_reporter_contacts, case_reporter, court_name, court_number, police_station,ob_number,case_status, referral_present,timestamp_created, is_void, sync_id, parent_case_id, created_by, case_remarks, date_of_summon, summon_status, person_id, case_stage FROM
--     dblink('dbname=cpims_dcs', 'select case_id,case_serial, perpetrator_status, perpetrator_first_name,  perpetrator_other_names,perpetrator_surname,perpetrator_relationship_type,risk_level, date_case_opened,case_reporter_first_name,case_reporter_other_names, case_reporter_surname,case_reporter_contacts, case_reporter, court_name, court_number, police_station,ob_number,case_status, referral_present,timestamp_created, is_void, sync_id, parent_case_id, created_by, case_remarks, date_of_summon, summon_status, person_id, case_stage from ovc_case_record')
-- AS t(case_id uuid,case_serial varchar, perpetrator_status varchar, perpetrator_first_name varchar,  perpetrator_other_names varchar,perpetrator_surname varchar,perpetrator_relationship_type varchar,risk_level varchar, date_case_opened date,case_reporter_first_name varchar,case_reporter_other_names varchar, case_reporter_surname varchar,case_reporter_contacts varchar, case_reporter varchar, court_name varchar, court_number varchar, police_station varchar,ob_number varchar,case_status varchar, referral_present varchar,timestamp_created date, is_void bool, sync_id uuid, parent_case_id uuid, created_by int, case_remarks varchar, date_of_summon date, summon_status bool, person_id int, case_stage int4)
-- );

-- ---working fine


-- --------------OVC_case_category


-- INSERT INTO ovc_case_category ( case_category_id , case_category , case_grouping_id , date_of_event , place_of_event , case_nature , timestamp_created , is_void ,sync_id , case_id_id , person_id )
-- (SELECT case_category_id , case_category , case_grouping_id , date_of_event , place_of_event , case_nature , timestamp_created , is_void ,sync_id , case_id_id , person_id FROM    dblink('dbname=cpims_dcs', 'select case_category_id , case_category , case_grouping_id , date_of_event , place_of_event , case_nature , timestamp_created , is_void ,sync_id , case_id_id , person_id FROM ovc_case_category')
-- AS t(case_category_id uuid, case_category varchar , case_grouping_id uuid , date_of_event date , place_of_event varchar , case_nature varchar, timestamp_created date, is_void bool ,sync_id uuid , case_id_id uuid, person_id int4));

-- ---working fine


-- -----ovc_case_geo

-- INSERT INTO ovc_case_geo (id, report_ward, report_village, occurence_ward, occurence_village, timestamp_created, is_void, sync_id, case_id_id, occurence_county_id, occurence_subcounty_id, person_id, report_orgunit_id, report_subcounty_id )
-- (SELECT id, report_ward, report_village, occurence_ward, occurence_village, timestamp_created, is_void, sync_id, case_id_id, occurence_county_id, occurence_subcounty_id, person_id, report_orgunit_id, report_subcounty_id FROM
--     dblink('dbname=cpims_dcs', 'select id, report_ward, report_village, occurence_ward, occurence_village, timestamp_created, is_void, sync_id, case_id_id, occurence_county_id, occurence_subcounty_id, person_id, report_orgunit_id, report_subcounty_id FROM ovc_case_geo')
-- AS t( id int, report_ward varchar, report_village varchar, occurence_ward varchar, occurence_village varchar, timestamp_created date, is_void bool, sync_id uuid, case_id_id uuid, occurence_county_id int4, occurence_subcounty_id int4, person_id int4, report_orgunit_id int4, report_subcounty_id int4));

-------ovc_placement

INSERT INTO ovc_placement (placement_id,residential_institution_name , admission_date, admission_type, transfer_from , admission_reason, holding_period , committing_period_units,committing_period,current_residential_status, has_court_committal_order,free_for_adoption,court_order_number, court_order_issue_date, committing_court, placement_notes, ob_number,placement_type,created_by,is_active,timestamp_created,is_void, sync_id,person_id, admission_number, residential_institution_id, transfer_from_institution_id, transfer_to_institution_id, case_record_id)
(SELECT placement_id,residential_institution_name , admission_date, admission_type, transfer_from , admission_reason, holding_period , committing_period_units,committing_period,current_residential_status, has_court_committal_order,free_for_adoption,court_order_number, court_order_issue_date, committing_court, placement_notes, ob_number,placement_type,created_by,is_active,timestamp_created,is_void, sync_id,person_id, admission_number, residential_institution_id,  transfer_from_institution_id, transfer_to_institution_id, case_record_id  FROM
    dblink('dbname=cpims_dcs', 'select placement_id,residential_institution_name , admission_date, admission_type, transfer_from , admission_reason, holding_period , committing_period_units,committing_period,current_residential_status, has_court_committal_order,free_for_adoption,court_order_number, court_order_issue_date, committing_court, placement_notes, ob_number,placement_type,created_by,is_active,timestamp_created,is_void, sync_id,person_id, admission_number,  residential_institution_id,  transfer_from_institution_id, transfer_to_institution_id, case_record_id  FROM ovc_placement')
AS t(placement_id uuid,residential_institution_name varchar, admission_date date, admission_type varchar, transfer_from varchar, admission_reason varchar, holding_period integer, committing_period_units varchar,committing_period integer,current_residential_status varchar, has_court_committal_order varchar,free_for_adoption varchar,court_order_number varchar, court_order_issue_date date, committing_court varchar, placement_notes varchar, ob_number varchar,placement_type varchar,created_by integer,is_active boolean,timestamp_created timestamp,is_void boolean, sync_id uuid,person_id integer, admission_number varchar, residential_institution_id integer,  transfer_from_institution_id integer, transfer_to_institution_id integer, case_record_id uuid)
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

-- INSERT INTO ovc_case_sub_category (case_sub_category_id, case_grouping_id, sub_category_id, timestamp_created, is_void, sync_id, case_category_id, person_id)
-- (SELECT case_sub_category_id, case_grouping_id, sub_category_id, timestamp_created, is_void, sync_id, case_category_id, person_id FROM
-- dblink('dbname=cpims_dcs', 'select case_sub_category_id, case_grouping_id, sub_category_id, timestamp_created, is_void, sync_id, case_category_id, person_id FROM ovc_case_sub_category') AS t(case_sub_category_id uuid, case_grouping_id uuid, sub_category_id varchar, timestamp_created timestamptz, is_void bool, sync_id uuid, case_category_id uuid, person_id int4));
