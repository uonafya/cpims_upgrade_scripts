## a. Prep DB

echo "< 001: DB Prep running ..."

# 1. Alter all constraints
echo "001: DB Prep: alter all constraints ..."
psql -h localhost -d cpims -U cpimsdbuser -a -w -f all_foreign_keys_constraints_update_cascade.sql

echo "001: DB Prep: organisation_units ..."
# 2. Prepare organisation units
psql -h localhost -d cpims -U cpimsdbuser -a -w -f reg_org_unit/reg_org_unit_update_ids.sql

echo "001: DB Prep: reg_persons ..."
# 3. Prepare reg_person
psql -h localhost -d cpims -U cpimsdbuser -a -w -f reg_person/alter_reg_persons.sql

echo "001: DB Prep: auth_users ..."
# 4. Prepare auth_user
psql -h localhost -d cpims -U cpimsdbuser -a -w -f auth_user/alter_auth_user.sql

echo "001: DB Prep completed />"
