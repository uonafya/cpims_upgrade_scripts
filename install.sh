psql -h localhost -d cpims -U cpimsdbuser -a -w -f all_foreign_keys_unicorn_ever_since_amen.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f reg_org_unit/reg_org_unit_update_ids.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f auth_user/alter_auth_user.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_reg_person_01.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_auth_user_01.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_reg_org_units_01.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_reg_person_02.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_reg_org_units_02.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_reg_person_03.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_ovc_case_records.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_ovc_metadata_01.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_reg_household.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_reg_org_units_03.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_auth_user_02.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_django_content_type.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_forms.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_list_general.sql
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_ovc_metadata_02.sql
