echo "< ===================== 002 (:) Merge queries started ===================== ..."

# DB prep

echo "< --------------- 001: DB Prep running --------------- ..."

# 1. Alter all constraints
echo "001 (a): DB Prep: alter all constraints ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f all_foreign_keys_constraints_update_cascade.sql

# 2. Prepare organisation units
echo "001 (b): DB Prep: alter organisation_units constraints ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f reg_org_unit/reg_org_unit_update_ids.sql

# 3. Prepare reg_person
echo "001 (c): DB Prep: alter reg_persons constraints ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f reg_person/alter_reg_persons.sql

# 4. Prepare auth_user
echo "001 (d): DB Prep: alter auth_users constraints ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f auth_user/alter_auth_user.sql

echo "001: --------------- DB Prep completed --------------- />"


echo "<--------------- 002: Data import running --------------- ..."
echo " 002 (a): import DCS reg_persons ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_reg_person_01.sql

echo " 002 (b): import DCS auth_user ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_auth_user_01.sql

echo " 002 (c): import DCS reg_org_unit, reg_org_units_geo ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_reg_org_units_01.sql

echo " 002 (d): import DCS reg_person_geo, reg_persons_org_units, reg_persons_external_ids, reg_persons_audit_trail ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_reg_person_02.sql
#--
echo " 002 (e): import DCS reg_org_units_audit_trail ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_reg_org_units_02.sql

echo " 002 (f): import DCS reg_person_master, reg_persons_guardians, reg_persons_siblings, reg_persons_types ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_reg_person_03.sql

echo " 002 (g): import DCS ovc_case_record, ovc_case_category, ovc_case_geo, ovc_placement, ovc_case_events, ovc_case_event_closure, ovc_case_event_court, ovc_case_event_encounters, ovc_case_event_summon, ovc_case_sub_category ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_ovc_case_records.sql

echo " 002 (h): import DCS ovc_cluster, ovc_cluster_cbo, ovc_discharge_followup, school_list, ovc_education_followup, ovc_education_level_followup, ovc_family_care, ovc_family_status, ovc_friends, ovc_hobbies, ovc_medical, ovc_medical_subconditions, ovc_placement_followup, ovc_needs, ovc_referrals ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_ovc_metadata_01.sql

echo " 002 (i): import DCS reg_household ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_reg_household.sql

echo " 002 (j): import DCS reg_org_units_contact, reg_org_units_external_ids ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_reg_org_units_03.sql

echo " 002 (k): import DCS auth_user_groups, auth_user_user_permissions, auth_user_groups_geo_org ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_auth_user_02.sql

echo " 002 (l): import DCS django_content_type ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_django_content_type.sql

echo " 002 (m): import DCS forms_audit_trail, forms_log ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_forms.sql

echo " 002 (n): import DCS list_general ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_list_general.sql

echo " 002 (o): import DCS ovc_bursaryinfo, ovc_adverseevents_followup, ovc_adverseevents_other_followup, ovc_economic_status ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f append_data/append_ovc_metadata_02.sql
echo "002: --------------- Data import completed --------------- />"

echo "===================== Merge queries completed ===================== />"
