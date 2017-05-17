include: "names_step_0.view.lkml"
#
# Add some very basic comutations to
#  calculate the number of different names
#  the total size of the population

# make a new view, names_step_1
view: names_step_1 {
  # use all the fields in names_step_0
  #  and add or change the following fields
  extends: [names_step_0]
  # number of Different Names
  measure: name_count {
    type: count_distinct
    sql: ${name} ;;
    drill_fields: [name, total_population]
  }

  # sum the populations
  measure: total_population {
    type: sum
    sql: ${population} ;;
  }
}
