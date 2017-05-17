- dashboard: state_locality
  title:  States and the Names that are Most Over Represented in the Population
  layout: tile
  tile_size: 40

  filters:
  - name: year
    title: "Year"
    type: number_filter

  - name: threshold
    title: Threshold Population
    type: number_filter
    default_value: '>5000'



  elements:

  - &default
    name: ak
    title: AK
    filters:
      names_step_10.select_state: AK
    type: table
    model: name_game
    explore: names_step_10
    dimensions: [names_step_10.name]
    measures: [names_step_10.total_population, names_step_10.percent_in_select_state]
    hidden_fields: [names_step_10.total_population, names_step_10.percent_in_select_state]
    sorts: [names_step_10.percent_in_select_state desc]
    limit: 15
    show_view_names: true
    table_theme: editable
    width: 4
    height: 11
    listen:
      threshold: names_step_10.total_population
      year: names_step_10.year

  - <<: *default
    name: AL
    title: AL
    filters:
      names_step_10.select_state: AL

  - <<: *default
    name: AR
    title: AR
    filters:
      names_step_10.select_state: AR

  - <<: *default
    name: AZ
    title: AZ
    filters:
      names_step_10.select_state: AZ

  - <<: *default
    name: CA
    title: CA
    filters:
      names_step_10.select_state: CA

  - <<: *default
    name: CO
    title: CO
    filters:
      names_step_10.select_state: CO

  - <<: *default
    name: CT
    title: CT
    filters:
      names_step_10.select_state: CT

  - <<: *default
    name: DC
    title: DC
    filters:
      names_step_10.select_state: DC

  - <<: *default
    name: DE
    title: DE
    filters:
      names_step_10.select_state: DE

  - <<: *default
    name: FL
    title: FL
    filters:
      names_step_10.select_state: FL

  - <<: *default
    name: GA
    title: GA
    filters:
      names_step_10.select_state: GA

  - <<: *default
    name: HI
    title: HI
    filters:
      names_step_10.select_state: HI

  - <<: *default
    name: IA
    title: IA
    filters:
      names_step_10.select_state: IA

  - <<: *default
    name: ID
    title: ID
    filters:
      names_step_10.select_state: ID

  - <<: *default
    name: IL
    title: IL
    filters:
      names_step_10.select_state: IL

  - <<: *default
    name: IN
    title: IN
    filters:
      names_step_10.select_state: IN

  - <<: *default
    name: KS
    title: KS
    filters:
      names_step_10.select_state: KS

  - <<: *default
    name: KY
    title: KY
    filters:
      names_step_10.select_state: KY

  - <<: *default
    name: LA
    title: LA
    filters:
      names_step_10.select_state: LA

  - <<: *default
    name: MA
    title: MA
    filters:
      names_step_10.select_state: MA

  - <<: *default
    name: MD
    title: MD
    filters:
      names_step_10.select_state: MD

  - <<: *default
    name: ME
    title: ME
    filters:
      names_step_10.select_state: ME

  - <<: *default
    name: MI
    title: MI
    filters:
      names_step_10.select_state: MI

  - <<: *default
    name: MN
    title: MN
    filters:
      names_step_10.select_state: MN

  - <<: *default
    name: MO
    title: MO
    filters:
      names_step_10.select_state: MO

  - <<: *default
    name: MS
    title: MS
    filters:
      names_step_10.select_state: MS

  - <<: *default
    name: MT
    title: MT
    filters:
      names_step_10.select_state: MT

  - <<: *default
    name: NC
    title: NC
    filters:
      names_step_10.select_state: NC

  - <<: *default
    name: ND
    title: ND
    filters:
      names_step_10.select_state: ND

  - <<: *default
    name: NE
    title: NE
    filters:
      names_step_10.select_state: NE

  - <<: *default
    name: NH
    title: NH
    filters:
      names_step_10.select_state: NH

  - <<: *default
    name: NJ
    title: NJ
    filters:
      names_step_10.select_state: NJ

  - <<: *default
    name: NM
    title: NM
    filters:
      names_step_10.select_state: NM

  - <<: *default
    name: NV
    title: NV
    filters:
      names_step_10.select_state: NV

  - <<: *default
    name: NY
    title: NY
    filters:
      names_step_10.select_state: NY

  - <<: *default
    name: OH
    title: OH
    filters:
      names_step_10.select_state: OH

  - <<: *default
    name: OK
    title: OK
    filters:
      names_step_10.select_state: OK

  - <<: *default
    name: OR
    title: OR
    filters:
      names_step_10.select_state: OR

  - <<: *default
    name: PA
    title: PA
    filters:
      names_step_10.select_state: PA

  - <<: *default
    name: RI
    title: RI
    filters:
      names_step_10.select_state: RI

  - <<: *default
    name: SC
    title: SC
    filters:
      names_step_10.select_state: SC

  - <<: *default
    name: SD
    title: SD
    filters:
      names_step_10.select_state: SD

  - <<: *default
    name: TN
    title: TN
    filters:
      names_step_10.select_state: TN

  - <<: *default
    name: TX
    title: TX
    filters:
      names_step_10.select_state: TX

  - <<: *default
    name: UT
    title: UT
    filters:
      names_step_10.select_state: UT

  - <<: *default
    name: VA
    title: VA
    filters:
      names_step_10.select_state: VA

  - <<: *default
    name: VT
    title: VT
    filters:
      names_step_10.select_state: VT

  - <<: *default
    name: WA
    title: WA
    filters:
      names_step_10.select_state: WA

  - <<: *default
    name: WI
    title: WI
    filters:
      names_step_10.select_state: WI

  - <<: *default
    name: WV
    title: WV
    filters:
      names_step_10.select_state: WV

  - <<: *default
    name: WY
    title: WY
    filters:
      names_step_10.select_state: WY
