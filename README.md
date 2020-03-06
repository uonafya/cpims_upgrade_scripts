# CPIMS-DCS-OVC Merge Queries &amp; Scripts

Scripts used in merging DCS &amp; OVC CPIMS instances       
**NOTE:** Ensure you execute the queries/scripts in the sequence given. To that end, do not execute the SQL files directly in your console; rather use/execute the shell script given.

---

Set your Postgres password in your system environment variables
``` bash
$ export PGPASSWORD=password   #your postgres password
```

Clone this repository and run `install.sh`
``` bash
$ git clone https://github.com/uonafya/cpims_upgrade_scripts
$ cd cpims_upgrade_scripts
$ sh ./install.sh
```

---
## What the scripts do:
### (a) Prepare the database
1. Drop all constraints in all tables in the database
2. Reappend all constraints with 'ON DELETE CASCADE ON UPDATE CASCADE' added
3. Move existing OVC reg_org_unit records up by 6500, (i.e. ID 500 becomes ID 7000) to give room for records from DCS
4. Move existing OVC reg_person records up by 1020000 for records between 290000 and 420000
5. Move existing OVC auth_user records up by 1000, starting at ID 2 (i.e. ID 2 becomes ID 1002) to give room for records from DCS

### (b) Import data from DCS
1. In this order:   
(a).     import DCS reg_persons     
(b).     import DCS auth_user   
(c).     import DCS reg_org_unit, reg_org_units_geo     
(d).     import DCS reg_person_geo, reg_persons_org_units, reg_persons_external_ids, reg_persons_audit_trail    
(e).     import DCS reg_org_units_audit_trail   
(f).     import DCS reg_person_master, reg_persons_guardians, reg_persons_siblings, reg_persons_types   
(g).     import DCS ovc_case_record, ovc_case_category, ovc_case_geo, ovc_placement, ovc_case_events, ovc_case_event_closure,  ovc_case_event_court, ovc_case_event_encounters, ovc_case_event_summon, ovc_case_sub_category      
(h).     import DCS ovc_cluster, ovc_cluster_cbo, ovc_discharge_followup, school_list, ovc_education_followup, ovc_education_level_followup, ovc_family_care, ovc_family_status, ovc_friends, ovc_hobbies, ovc_medical, ovc_medical_subconditions, ovc_placement_followup, ovc_needs, ovc_referrals     
(i).     import DCS reg_household   
(j).     import DCS reg_org_units_contact, reg_org_units_external_ids   
(k).     import DCS auth_user_groups, auth_user_user_permissions, auth_user_groups_geo_org  
(l).     import DCS django_content_type     
(m).     import DCS forms_audit_trail, forms_log    
(n).     import DCS list_general    
(o).     import DCS ovc_bursaryinfo, ovc_adverseevents_followup, ovc_adverseevents_other_followup, ovc_economic_status  
