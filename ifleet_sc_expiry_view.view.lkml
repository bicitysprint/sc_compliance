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

  dimension: expiry_status {
    type: string
    sql:

    case
      when ${days_left} =0 then 'EXPIRY: TODAY'
      when ${days_left} =-1 then 'EXPIRY: YESTERDAY'
      when ${days_left} <=-2 and ${days_left} >=-7 then 'EXPIRY: LESS THAN 7 DAYS AGO'
      when ${days_left} <=-8 and ${days_left} >=-14 then 'EXPIRY: MORE THAN 7 DAYS AGO'
      when ${days_left} <=-15 and ${days_left} >=-30 then 'EXPIRY: MORE THAN 14 DAYS AGO'
      when ${days_left} <=-30 then 'EXPIRY: MORE THAN 30 DAYS AGO'
      when ${days_left} >= 1 then 'NOT YET EXPIRED'
      when ${days_left} IS NULL then 'NO EXPIRY DATE'
      else 'OTHER' end    ;;
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

  dimension: report_section {
  type: string
  sql: ${TABLE}."REPORT_SECTION" ;;
  }

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


##dimension: expiry_category {
##  type: string
##  sql: ${TABLE}."EXPIRY_CATEGORY" ;;




  ##measure: days_since_expiry_count {
  ##  type: list
  ##  list_field: days_left
  ##  sql: ${TABLE}."DAYS_LEFT" ;;
  ##}





  measure: count {
    type: count
    drill_fields: [drilldown*]
  }

  ##measure: sum {
  ##  type: sum
  ##  sql: ${expiry_status} ;;
  ##}


  set:drilldown {

    fields: [created_date, expiry_date, current_date, days_left, type_no, universal, sc_name,doc_name,filesid, email, report_section]

  }





}
