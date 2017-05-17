include: "names_step_3.view.lkml"
# build out cohort analysis to normalize data by cohort
#  so you can compare names popularity between states or years
#
view: names_step_4 {
  extends: [names_step_3]

  measure: percentage_of_cohort {
    type: number
    sql: 1.0 *${total_population} / ${cohorts.cohort_size} ;;
    value_format_name: percent_2
  }
}
