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