# Suggest gender neutral Names
explore: names_suggest {
  hidden: yes
}

view: names_suggest {
  derived_table: {
    persist_for: "100 hours"
    sql: SELECT
        name,SUM(number) as n1
      FROM
        {% if _dialect._name == 'bigquery' %}
          [fh-bigquery:popular_names.usa_1910_2013]
        {% else %}
          names
        {% endif %}
      GROUP BY 1
      ORDER by 2 DESC
      LIMIT 4900
       ;;
  }

  dimension: name {}
}

view: suggest {
  dimension: name {
    suggest_explore: names_suggest
    suggest_dimension: name
  }

  dimension: gender {
    suggestions: ["M", "F"]
  }
}
