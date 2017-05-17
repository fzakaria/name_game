connection: "lookerdata_publicdata"

# added by Tig so filters aren't case sensitive
case_sensitive: no

include: "names*.view"

include: "*.dashboard"

persist_for: "10000 hours"

case_sensitive: no

# basic model out of the generator
explore: names_step_0 {
  hidden: yes
}

# add some simple measures
explore: names_step_1 {
  hidden: yes
}

# add some simple dimensions
explore: names_step_2 {
  label: "Name Game Basic"
}

#hidden: true

# add some filtered measure to analyse specific things
explore: names_step_3 {
  hidden: yes
}

# build a percent of cohort to normalize data
explore: names_step_4 {
  hidden: yes

  join: cohorts {
    sql_on: ${state} = ${cohorts.state}
      AND ${year} = ${cohorts.year}
      AND ${gender} = ${cohorts.gender}
       ;;
    relationship: many_to_one
  }
}

# rank names within state and year to find name density
explore: names_step_5 {
  extends: [names_step_4]
  hidden: yes
}

# Add a fact table
explore: names_step_6 {
  extends: [names_step_5]

  join: names_facts {
    sql_on: ${name} = ${names_facts.name}
      AND ${gender} = ${names_facts.gender}
       ;;
    relationship: many_to_one
  }
}

# add some lists
explore: names_step_7 {
  extends: [names_step_6]
}


# add some external links
explore: names_step_8 {
  extends: [names_step_7]
}

# add some external links
explore: names_step_9 {
  label: "Name Game Advanced"
  extends: [names_step_8]
  view_name: name_game
  from: names_step_9

  join: target {
    type: cross
    relationship: one_to_one
  }
}

explore: names_step_10 {
  extends: [names_step_8]
  hidden: yes
}

# place to start exploring from
explore: name_game {
  # Tig: changed from names_step_9 and back to 8
  extends: [names_step_8]
  from: names_step_8
  hidden: no
}
