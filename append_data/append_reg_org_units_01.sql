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

