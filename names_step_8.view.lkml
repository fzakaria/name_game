include: "names_suggest.view.lkml"
include: "names_step_7.view.lkml"



view: names_step_8 {
  extends: [names_step_7, suggest]

  dimension: name {
    drill_fields: [state, decade, region]

    link: {
      label: "Learn more about the name '{{ value }}'"
      url: "https://looker.com/publicdata/dashboards/3?Name={{ value }}"
      icon_url: "https://looker.com/favicon.ico"
    }

    link: {
      label: "Search Wikipedia for {{value}}"
      url: "https://en.wikipedia.org/wiki/{{value}}"
      icon_url: "https://en.wikipedia.org/static/favicon/wikipedia.ico"
    }
  }

  dimension: is_laggard {
    type: yesno
    sql: ${year} > ${names_facts.year_85_percent} ;;
  }

  measure: is_laggard_year {
    type: min
    sql: (CASE WHEN ${is_laggard} = 0 then NULL ELSE ${is_laggard} END) ;;
  }

  dimension: is_early_adopter {
    type: yesno
    sql: ${year} < ${names_facts.year_15_percent} ;;
  }

  measure: is_early_adopter_year {
    type: min
    sql: (CASE WHEN ${is_early_adopter} = 0 then NULL ELSE ${is_early_adopter} END) ;;
  }

  measure: is_peak_year {
    type: min
    sql: (CASE WHEN ${is_early_adopter} = 1 OR ${is_laggard} = 1 then NULL ELSE 1 END) ;;
  }

  dimension: adoption_category {
    case: {
      when: {
        sql: ${year} < ${names_facts.year_15_percent} ;;
        label: "Early Adopters"
      }

      when: {
        sql: ${year} > ${names_facts.year_85_percent} ;;
        label: "Laggards"
      }

      when: {
        sql: true ;;
        label: "Peak"
      }
    }
  }

  dimension: decade {
    sql: floor(${year}/10)*10 ;;
    html: {{ rendered_value }}
      ;;
  }
}
