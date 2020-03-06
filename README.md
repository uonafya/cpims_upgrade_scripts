# CPIMS-DCS-OVC Merge Queries &amp; Scripts

Scripts used in merging DCS &amp; OVC CPIMS instances       
**NOTE:** Ensure you execute the queries/scripts in the sequence given. To that end, do not execute the SQL files directly in your console; rather use/execute the shell script given.

---

### (a) Prepare the database
1. Drop all constraints in all tables in the database
2. Reappend all constraints with 'ON DELETE CASCADE ON UPDATE CASCADE' added
3. Move existing OVC reg_org_unit records up by 650, (i.e. ID 500 becomes ID 7000) to give room for ~500 records from DCS
4. Move existing OVC reg_person records up by 1020000 for records between 290000 and 420000
5. Move existing OVC auth_user records up by 1000, starting at ID 2 (i.e. ID 2 becomes ID 1002) to give room for ~900 records from DCS

### (b) Import data from DCS
1. In this order:   
i.      Organisation units registry (reg_org_units)     
ii.     Persons registry (reg_person)   
iii.    User accounts (auth_user)       
iv.     ... All other data
