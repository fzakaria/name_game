include: "names_step_8.view.lkml"

view: names_step_10 {
  extends: [names_step_8]

  filter: select_state {
    suggest_dimension: state
  }

  dimension: is_state {
    hidden: yes
    type: yesno
    sql: {% condition select_state %} ${state} {% endcondition %}
      ;;
  }

  measure: total_in_select_state {
    type: sum
    sql: ${population} ;;

    filters: {
      field: is_state
      value: "Yes"
    }
  }

  measure: percent_in_select_state {
    type: number
    sql: ${total_in_select_state}/${total_population} ;;
  }
}
