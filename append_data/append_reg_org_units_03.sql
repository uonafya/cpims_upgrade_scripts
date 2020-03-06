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
