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