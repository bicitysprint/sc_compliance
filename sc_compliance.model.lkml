connection: "db"

# include all the views
include: "*.view"

datagroup: sc_compliance_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "10 hour"
}

persist_with: sc_compliance_default_datagroup


explore: ifleet_sc_expiry_view {}
