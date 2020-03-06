-- create temporary backup table
-- CREATE TABLE tmp_auth_user AS (SELECT * FROM auth_user);
CREATE TABLE tmp_auth_user AS (select id, ROW_NUMBER () OVER (ORDER BY id) + 1000 as new_id from auth_user where id > 1);

-- reset the ids to the new ids created in temp
UPDATE auth_user SET id=tmp_auth_user.new_id FROM tmp_auth_user WHERE auth_user.id=tmp_auth_user.id;

<<<<<<< HEAD
DELETE FROM auth_user WHERE id < 1001 AND id > 1;
=======
-- DELETE FROM auth_user WHERE id > 1 AND id < 1001;
>>>>>>> 644a6a5c9291b838631c5921b2c803935e7cc16a
