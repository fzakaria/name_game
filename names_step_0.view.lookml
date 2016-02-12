#
# Automatically generated by Looker based on the table
#
- view: names_step_0
  sql_table_name: names
  fields:
  - dimension: name
    sql: ${TABLE}.name

  - dimension: gender
    sql: ${TABLE}.gender

  - dimension: state
    sql: ${TABLE}.state

  - dimension: year
    type: number
    sql: ${TABLE}.year
    value_format: "0000"    # format without commas
 
  - dimension: population   # rename from 'number' to 'population'
    type: number
    sql: ${TABLE}.number
    
  - measure: count
    type: count
    drill_fields: [name, gender, state, year, population]