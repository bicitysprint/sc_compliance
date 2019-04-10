view: ifleet_sc_expiry_view {
  sql_table_name: CC.IFLEET_SC_EXPIRY_VIEW ;;

   dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CREATED_DATE" ;;
  }

  dimension_group: current {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CURRENT_DATE" ;;
  }

  dimension: days_left {
    type: string
    sql: ${TABLE}."DAYS_LEFT" ;;
  }

  dimension: doc_name {
    type: string
    sql: ${TABLE}."DOC_NAME" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension_group: expiry {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."EXPIRY_DATE" ;;
  }

  dimension: filesid {
    type: string
    sql: ${TABLE}."FILESID" ;;
  }

  ##dimension: report_section {
    ##type: string
    ##sql: ${TABLE}."REPORT_SECTION" ;;
  ##}

  dimension: sc_name {
    type: string
    sql: ${TABLE}."SC_NAME" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: type_no {
    type: string
    sql: ${TABLE}."TYPE_NO" ;;
  }

  dimension: universal {
    type: string
    sql: ${TABLE}."UNIVERSAL" ;;
  }

  dimension: userid {
    type: string
    sql: ${TABLE}."USERID" ;;
  }


dimension: expiry_category {

  type: string
  sql: ${TABLE}."EXPIRY_CATEGORY" ;;


}


  parameter: report_section {
    type: unquoted
    default_value: "expired"
    allowed_value: {
      value: "expired"
      label: "Expired"
    }
    allowed_value: {
      value: "expires today"
      label: "Expires today"
    }
    allowed_value: {
      value: "expires within 7 days"
      label: "Expires within 7 days"
    }

    allowed_value: {
      value: "expires within 30 days"
      label: "Expires within 30 days"
    }

    allowed_value: {
      value: "30+ days left until expiry"
      label: "30+ days left until expiry"
    }

    allowed_value: {
      value: "no expiry date"
      label: "No expiry date"
    }


  }


  dimension: product_hierarchy {
    label_from_parameter: report_section
    type: string
    sql: ${TABLE}.{{ report_section._parameter_value }} ;;
  }





  measure: count {
    type: count
    drill_fields: [drilldown*]
  }




  set:drilldown {

    fields: [created_date, expiry_date, current_date, days_left, type_no, universal, sc_name,doc_name, report_section]

  }





}
