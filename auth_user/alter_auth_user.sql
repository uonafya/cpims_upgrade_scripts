-- create temporary backup table
-- CREATE TABLE tmp_auth_user AS (SELECT * FROM auth_user);
CREATE TABLE tmp_auth_user AS (select id, ROW_NUMBER () OVER (ORDER BY id) + 1000 as new_id from auth_user where id>1 and <2200);

-- drop_constraint query
ALTER TABLE auth_user DROP CONSTRAINT auth_user_reg_person_id_a5c91cbe2cfbe65_fk_reg_person_id;
ALTER TABLE auth_login_policy DROP CONSTRAINT auth_login_policy_user_id_2a000083249850f3_fk_auth_user_id;
ALTER TABLE auth_password_history DROP CONSTRAINT auth_password_history_user_id_1ecd95ccff6ec6ef_fk_auth_user_id;
ALTER TABLE auth_user_groups DROP CONSTRAINT auth_user_groups_appuser_id_140c4151b9b710f6_fk_auth_user_id;
ALTER TABLE auth_user_groups_geo_org DROP CONSTRAINT auth_user_groups_geo_o_user_id_53e9b4ca440fa583_fk_auth_user_id;
ALTER TABLE auth_user_history DROP CONSTRAINT auth_user_history_by_user_id_16232a83177d557e_fk_auth_user_id;
ALTER TABLE auth_user_history DROP CONSTRAINT auth_user_history_user_id_349f02c4c5f84b8d_fk_auth_user_id;
ALTER TABLE auth_user_user_permissions DROP CONSTRAINT auth_user_user_perm_appuser_id_4ded6dff68fa5090_fk_auth_user_id;
ALTER TABLE bursary_application DROP CONSTRAINT bursary_application_app_user_id_65ba7900ff55a47_fk_auth_user_id;
ALTER TABLE django_admin_log DROP CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id;
ALTER TABLE forms_audit_trail DROP CONSTRAINT forms_audit_trail_app_user_id_4a93590a789fdf42_fk_auth_user_id;
ALTER TABLE ovc_case_events DROP CONSTRAINT ovc_case_events_app_user_id_30b4df3aa8f8294d_fk_auth_user_id;
ALTER TABLE ovc_checkin DROP CONSTRAINT ovc_checkin_user_id_5c8d644380b650ca_fk_auth_user_id;
ALTER TABLE ovc_cluster DROP CONSTRAINT ovc_cluster_created_by_id_5d6bb87c43de606e_fk_auth_user_id;
ALTER TABLE reg_biometric DROP CONSTRAINT reg_biometric_account_id_adc14cc02ec22e0_fk_auth_user_id;
ALTER TABLE reg_org_unit DROP CONSTRAINT reg_org_unit_created_by_id_24e2c311540225aa_fk_auth_user_id;
ALTER TABLE reg_org_units_audit_trail DROP CONSTRAINT reg_org_units_audi_app_user_id_4eaebb94181c7a3a_fk_auth_user_id;
ALTER TABLE reg_person DROP CONSTRAINT reg_person_created_by_id_6077a86828bf2974_fk_auth_user_id;
ALTER TABLE reg_persons_audit_trail DROP CONSTRAINT reg_persons_audit__app_user_id_3b2a1e563d3e4ba8_fk_auth_user_id;

-- add_constraint_cascade_update query
ALTER TABLE auth_user ADD CONSTRAINT auth_user_reg_person_id_a5c91cbe2cfbe65_fk_reg_person_id FOREIGN KEY (reg_person_id) REFERENCES reg_person(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE auth_login_policy ADD CONSTRAINT auth_login_policy_user_id_2a000083249850f3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE auth_password_history ADD CONSTRAINT auth_password_history_user_id_1ecd95ccff6ec6ef_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE auth_user_groups ADD CONSTRAINT auth_user_groups_appuser_id_140c4151b9b710f6_fk_auth_user_id FOREIGN KEY (appuser_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE auth_user_groups_geo_org ADD CONSTRAINT auth_user_groups_geo_o_user_id_53e9b4ca440fa583_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE auth_user_history ADD CONSTRAINT auth_user_history_by_user_id_16232a83177d557e_fk_auth_user_id FOREIGN KEY (by_user_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE auth_user_history ADD CONSTRAINT auth_user_history_user_id_349f02c4c5f84b8d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE auth_user_user_permissions ADD CONSTRAINT auth_user_user_perm_appuser_id_4ded6dff68fa5090_fk_auth_user_id FOREIGN KEY (appuser_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE bursary_application ADD CONSTRAINT bursary_application_app_user_id_65ba7900ff55a47_fk_auth_user_id FOREIGN KEY (app_user_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE django_admin_log ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE forms_audit_trail ADD CONSTRAINT forms_audit_trail_app_user_id_4a93590a789fdf42_fk_auth_user_id FOREIGN KEY (app_user_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ovc_case_events ADD CONSTRAINT ovc_case_events_app_user_id_30b4df3aa8f8294d_fk_auth_user_id FOREIGN KEY (app_user_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ovc_checkin ADD CONSTRAINT ovc_checkin_user_id_5c8d644380b650ca_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ovc_cluster ADD CONSTRAINT ovc_cluster_created_by_id_5d6bb87c43de606e_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE reg_biometric ADD CONSTRAINT reg_biometric_account_id_adc14cc02ec22e0_fk_auth_user_id FOREIGN KEY (account_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE reg_org_unit ADD CONSTRAINT reg_org_unit_created_by_id_24e2c311540225aa_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE reg_org_units_audit_trail ADD CONSTRAINT reg_org_units_audi_app_user_id_4eaebb94181c7a3a_fk_auth_user_id FOREIGN KEY (app_user_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE reg_person ADD CONSTRAINT reg_person_created_by_id_6077a86828bf2974_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE reg_persons_audit_trail ADD CONSTRAINT reg_persons_audit__app_user_id_3b2a1e563d3e4ba8_fk_auth_user_id FOREIGN KEY (app_user_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- reset the ids to the new ids created in temp
UPDATE auth_user SET id=tmp_auth_user.new_id FROM tmp_auth_user WHERE auth_user.id=tmp_auth_user.id;

DELETE FROM auth_user WHERE id < 1001 AND id > 1;