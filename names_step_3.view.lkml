include: "names_step_2.view.lkml"
# Finding
#  gender neutral vs. gender specific names
#  old names vs new names
#  northeast names vs not northeast names

view: names_step_3 {
  extends: [names_step_2]
  # filtered measures

  measure: male_population {
    type: sum
    sql: ${population} ;;

    filters: {
      field: gender
      value: "M"
    }
  }

  measure: male_percentage {
    type: number
    sql: 1.0 * ${male_population} / ${total_population} ;;
    value_format_name: percent_2
  }

  measure: north_east_population {
    type: sum
    sql: ${population} ;;

    filters: {
      field: region
      value: "Northeast"
    }
  }

  measure: north_east_percentage {
    type: number
    sql: 1.0 *${north_east_population} / ${total_population} ;;
    value_format_name: percent_2
  }

  measure: before_1940_population {
    type: sum
    sql: ${population} ;;

    filters: {
      field: year
      value: "< 1940"
    }
  }

  measure: before_1940_percentage {
    type: number
    sql: 1.0 * ${before_1940_population} / ${total_population} ;;
    value_format_name: percent_2
  }
}
