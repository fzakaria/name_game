- explore: names_step_10
  extends: names_step_8
  hidden: true

- view: names_step_10
  extends: names_step_8

  fields:
    
  - filter: select_state
    suggest_dimension: state
    
  - dimension: is_state
    hidden: true
    type: yesno
    sql: |
      {% condition select_state %} ${state} {% endcondition %}
      
  - measure: total_in_select_state
    type: sum
    sql: ${population}
    filters:
      is_state: Yes
      
  - measure: percent_in_select_state
    type: number
    sql: ${total_in_select_state}/${total_population}
        