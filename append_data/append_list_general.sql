----list_general
INSERT INTO list_general (item_id , item_description, item_description_short, item_category , the_order, user_configurable , sms_keyword , is_void, field_name , timestamp_modified)
(SELECT item_id , item_description, item_description_short, item_category , the_order, user_configurable , sms_keyword , is_void, field_name , timestamp_modified FROM
    dblink('dbname=cpims_dcs', 'select item_id , item_description, item_description_short, item_category , the_order, user_configurable , sms_keyword , is_void, field_name , timestamp_modified FROM list_general')
AS t(item_id varchar, item_description varchar, item_description_short varchar , item_category varchar , the_order int4, user_configurable bool, sms_keyword bool, is_void bool, field_name varchar, timestamp_modified date)
WHERE item_id NOT IN (SELECT item_id FROM list_general) and item_description NOT IN (SELECT item_description FROM list_general)
);