include: "names_name_gender.view.lkml"
include: "names_step_5.view.lkml"
view: names_step_6 {
  extends: [names_step_5, name_gender]
}
