
INSERT INTO forms_audit_trail ( transaction_id, form_id, form_type_id, transaction_type_id, interface_id, timestamp_modified, ip_address, meta_data, app_user_id )
(SELECT transaction_id, form_id, form_type_id, transaction_type_id, interface_id, timestamp_modified, ip_address, meta_data, app_user_id FROM
    dblink('dbname=cpims_dcs', 'select transaction_id, form_id, form_type_id, transaction_type_id, interface_id, timestamp_modified, ip_address, meta_data, app_user_id from forms_audit_trail')
AS t( transaction_id int4, form_id uuid, form_type_id varchar, transaction_type_id varchar, interface_id varchar, timestamp_modified date, ip_address inet, meta_data text, app_user_id int4)
);

--working fine


---form_log

INSERT INTO forms_log (form_log_id, form_type_id, form_id, timestamp_created, is_void, sync_id, timestamp_modified, app_user, person_id)
(SELECT form_log_id, form_type_id, form_id, timestamp_created, is_void, sync_id, timestamp_modified, app_user, person_id FROM
    dblink('dbname=cpims_dcs ', 'select form_log_id, form_type_id, form_id, timestamp_created, is_void, sync_id, timestamp_modified, app_user, person_id from forms_log')
AS t(form_log_id uuid, form_type_id varchar, form_id varchar, timestamp_created timestamp, is_void boolean, sync_id uuid, timestamp_modified timestamp, app_user int4, person_id int4)
);
