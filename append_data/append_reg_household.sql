
INSERT INTO reg_household (id , members, is_void, timestamp_created , index_child_id)
(SELECT id , members, is_void, timestamp_created , index_child_id FROM
    dblink('dbname=cpims_dcs', 'select id , members, is_void, timestamp_created , index_child_id FROM reg_household')
AS t(id uuid, members text, is_void boolean, timestamp_created timestamp, index_child_id integer)
);
