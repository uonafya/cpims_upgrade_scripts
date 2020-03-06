## a. Prep DB

# 1. Alter all constraints
psql -h localhost -d cpims -U cpimsdbuser -a -w -f all_foreign_keys_unicorn_ever_since_amen.sql

# 2. Prepare organisation units
psql -h localhost -d cpims -U cpimsdbuser -a -w -f reg_org_unit/reg_org_unit_update_ids.sql

# 3. Prepare reg_person
psql -h localhost -d cpims -U cpimsdbuser -a -w -f reg_person/alter_reg_persons.sql

# 4. Prepare auth_user
psql -h localhost -d cpims -U cpimsdbuser -a -w -f auth_user/alter_auth_user.sql
