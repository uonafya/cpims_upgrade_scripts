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
