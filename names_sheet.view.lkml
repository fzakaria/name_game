include: "names_facts.view.lkml"

explore: names_sheet {
  persist_for: "60 seconds"

  join: names_facts {
    sql_on: ${names_sheet.normalized_name} = ${names_facts.normalized_name} ;;
    sql_where: ${names_facts.is_dominant_gender} ;;
    relationship: one_to_one
  }
}

view: names_sheet {
  derived_table: {
    persist_for: "2 minutes"
    sql: SELECT
          row_number() OVER() as id
          , name
          , UPPER(
            CASE WHEN REGEXP_MATCH(name, r'\,')
              THEN REGEXP_EXTRACT(name, r', (\w+)')
              ELSE REGEXP_EXTRACT(name, r'^(\w+)')
            END
          ) as normalized_name
        FROM namesheet.names
       ;;
  }

  dimension: id {
    type: number
  }

  dimension: name {
    # keep the rows in the original order
    order_by_field: id
  }

  dimension: normalized_name {}

  measure: count {
    type: count
    drill_fields: [id, name, names_facts.gender]
  }

  measure: count_male {
    type: count

    filters: {
      field: names_facts.gender
      value: "M"
    }
  }

  measure: percentage_male {
    type: number
    sql: ${count_male}/${count} ;;
    value_format_name: percent_2
  }

  measure: average_year_median {
    type: average
    sql: ${names_facts.year_median} ;;
    value_format: "0000"
  }
}
