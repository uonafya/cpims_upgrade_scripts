---django_content_type

INSERT INTO django_content_type ( app_label , model )
(SELECT app_label , model FROM
    dblink('dbname=cpims_dcs', 'select app_label, model from django_content_type')
AS t( app_label varchar , model varchar )
WHERE model NOT IN (SELECT model FROM django_content_type )
);