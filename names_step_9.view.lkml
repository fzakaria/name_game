include: "names_step_8.view.lkml"
explore: target {
  hidden: yes
}

view: target {
  derived_table: {
    sql: SELECT
        name as target_name
        , gender
        , year_median
        , year_15_percent
        , year_85_percent
        , overall_rank
      FROM ${names_facts.SQL_TABLE_NAME}
      WHERE
        {% condition target_name %} name {% endcondition %}
      ORDER BY overall_rank
      LIMIT 1
       ;;
  }

  dimension: target_name {}
  dimension: gender {}

  dimension: year_median {
    type: number
  }

  dimension: year_15_percent {
    type: number
  }

  dimension: year_85_percent {
    type: number
  }

  dimension: overall_rank {
    type: number
  }

  dimension: name_duration {
    type: number
    sql: ${year_85_percent} - ${year_15_percent} ;;
  }
}

view: names_step_9 {
  extends: [names_step_8]

  dimension: same_gender {
    type: yesno
    sql: ${gender} = ${target.gender} ;;
  }

  dimension: rank_closeness {
    type: number
    sql: SQRT(ABS(${names_facts.overall_rank} - ${target.overall_rank})) ;;
  }

  dimension: median_closeness {
    type: number
    sql: ABS(${names_facts.year_median} - ${target.year_median}) ;;
  }

  dimension: duration_closeness {
    type: number
    sql: ABS(${names_facts.name_duration} - ${target.name_duration}) ;;
  }

  dimension: closeness {
    type: number
    sql: ${median_closeness} * 5 + ${duration_closeness} + ${rank_closeness} ;;
  }
}
