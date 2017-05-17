include: "names_step_4.view.lkml"
# Rank names within states and years to understand name
#  density.
#
view: names_step_5 {
  extends: [names_step_4]
  sql_table_name: (SELECT * FROM (SELECT
      *,
      RANK() OVER (
        PARTITION BY year, state, gender
        ORDER BY number DESC) as name_rank
    FROM
    {% if _dialect._name == 'bigquery' %}
      [fh-bigquery:popular_names.usa_1910_2013]
    {% else %}
      names
    {% endif %}
    ))
     ;;

    dimension: name_rank {
      type: number
    }

    dimension: name_rank_tiered {
      type: tier
      tiers: [10, 30, 100, 300, 1000]
      style: integer
      sql: ${name_rank} ;;
    }

    measure: average_name_rank {
      type: average
      sql: ${name_rank} ;;
    }
  }
