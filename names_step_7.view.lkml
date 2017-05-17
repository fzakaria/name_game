include: "names_step_6.view.lkml"
view: names_step_7 {
  extends: [names_step_6]

  measure: name_list {
    type: list
    list_field: name
  }

  dimension: year_string {
    sql: STRING(${year}) ;;
    hidden: yes
  }

  measure: year_list {
    type: list
    list_field: year_string
  }

  measure: state_list {
    type: list
    list_field: state
  }

  measure: count_states {
    type: count_distinct
    sql: ${state} ;;
  }

  measure: min_year {
    type: min
    sql: ${year} ;;
  }

  measure: max_year {
    type: max
    sql: ${year} ;;
  }

  dimension: is_15_percent_year {
    type: yesno
    sql: ${names_facts.year_15_percent} = ${year} ;;
  }

  dimension: is_median_year {
    type: yesno
    sql: ${names_facts.year_median} = ${year} ;;
  }

  dimension: is_85_percent_year {
    type: yesno
    sql: ${names_facts.year_85_percent} = ${year} ;;
  }
}
