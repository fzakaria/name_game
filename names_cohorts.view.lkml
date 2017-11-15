view: cohorts {
  view_label: "Names"

  derived_table: {
    sql: SELECT
        year, state, gender,
        SUM(number) as number,
        row_number() OVER () as id
      FROM
        `fh-bigquery.popular_names.usa_1910_2013`
      GROUP BY 1,2,3
       ;;
  }

  dimension: id {
    primary_key: yes
  }

  dimension: year {
    hidden: yes
  }

  dimension: state {
    hidden: yes
  }

  dimension: gender {
    hidden: yes
  }

  dimension: number {
    #X# Invalid LookML inside "dimension": {"type":null}
  }

  measure: cohort_size {
    type: sum
    sql: ${number} ;;
  }
}
