CREATE TABLE tmp_reg_person AS (select * from reg_person);
UPDATE reg_person SET created_by_id=1 WHERE id != 1;