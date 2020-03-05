-- backup the original reg_persons overlapping set of records
CREATE TABLE tmp_reg_person AS (select id, ROW_NUMBER () OVER (ORDER BY id) + 1020000 as new_id, created_by_id from reg_person where id > 290000 AND id<420000);

-- reset the ids to the new ids created in temp
UPDATE reg_person SET id=tmp_reg_person.new_id FROM tmp_reg_person WHERE reg_person.id=tmp_reg_person.id;

DELETE FROM reg_person WHERE id > 1 AND id < 400000;