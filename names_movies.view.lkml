explore: names_movies {
  hidden: yes
}

view: names_movies {
  sql_table_name: [disco-parsec-659:imdb.actor_firstname_title_year]
    ;;
  dimension: name {}

  dimension: full_name {
    link: {
      label: "IMDb"
      url: "http://www.google.com/search?q=site:imdb.com+{{value}}&btnI"
      icon_url: "http://vignette3.wikia.nocookie.net/half-life/images/e/ef/IMDb_favicon.png/revision/latest?cb=20091226124457&path-prefix=en"
    }
  }

  dimension: title {
    link: {
      label: "IMDb"
      url: "http://www.google.com/search?q=site:imdb.com+{{value}}-{{year._value}}&btnI"
      icon_url: "http://vignette3.wikia.nocookie.net/half-life/images/e/ef/IMDb_favicon.png/revision/latest?cb=20091226124457&path-prefix=en"
    }
  }

  dimension: year {
    type: number
    value_format: "0000"
  }

  measure: actor_count {
    type: count_distinct
    sql: ${full_name} ;;
    drill_fields: [full_name, role_count]
  }

  measure: role_count {
    type: count_distinct
    sql: CONCAT(${title},STRING(${year}),${full_name}) ;;
    drill_fields: [title, year, full_name]
  }
}
