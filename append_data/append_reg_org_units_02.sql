
----reg_org_units_audit_trail
INSERT INTO reg_org_units_audit_trail (transaction_type_id, interface_id, timestamp_modified , ip_address,meta_data,app_user_id,org_unit_id)
(SELECT  transaction_type_id, interface_id, timestamp_modified , ip_address,meta_data,app_user_id,org_unit_id FROM
    dblink('dbname=cpims_dcs', 'select transaction_type_id, interface_id, timestamp_modified , ip_address,meta_data,app_user_id,org_unit_id FROM reg_org_units_audit_trail')
AS t(transaction_type_id varchar, interface_id varchar, timestamp_modified timestamp, ip_address inet,meta_data text,app_user_id integer,org_unit_id integer)
);