view: name_gender {
  dimension: name_gender {
    suggest_explore: names_gender_suggest
    suggest_dimension: name_gender
    sql: ${TABLE}.name_gender)
      ;;
  }
}

explore: names_gender_suggest {
  hidden: yes
}

view: names_gender_suggest {
  derived_table: {
    sql: SELECT
        CONCAT(name, '-' , gender) as name_gender
        , SUM(number)
      FROM
        `fh-bigquery.popular_names.usa_1910_2013`
      GROUP BY 1
      ORDER by 2 DESC
       ;;
  }

  dimension: name_gender {}
}
