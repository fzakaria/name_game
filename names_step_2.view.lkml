include: "names_step_1.view.lkml"
#
# bucketing the data by
#   decade
#   region
#   first letter of the name
#
view: names_step_2 {
  extends: [names_step_1]
  # computed dimensions
  dimension: decade {
    type: number
    sql: FLOOR(${year}/10) * 10 ;;
    value_format: "0000"
  }

  dimension: region {
    case: {
      when: {
        sql: ${state} in ('WA','OR','CA','NV','UT','WY','ID','MT',
              'CO','AK','HI')
           ;;
        label: "West"
      }

      when: {
        sql: ${state} in ('AZ','NM','TX','OK') ;;
        label: "Southwest"
      }

      when: {
        sql: ${state} in ('ND','SD','MN','IA','WI','MN','OH','IN','MO','NE',
              'KS','MI','IL')
           ;;
        label: "Midwest"
      }

      when: {
        sql: ${state} in ('MD','DE','NJ','CT','RI','MA','NH','PA',
              'NY','VT','ME','DC')
           ;;
        label: "Northeast"
      }

      when: {
        sql: ${state} in ('AR','LA','MS','AL','GA','FL','SC','NC','VA','TN',
              'KY','WV')
           ;;
        label: "Southeast"
      }

      when: {
        sql: true ;;
        label: "Unset"
      }
    }
  }

  dimension: first_letter {
    sql: SUBSTRING(${name},1,1) ;;
  }
}
