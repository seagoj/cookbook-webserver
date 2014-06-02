name "web"
description "The base role for systems that server HTTP traffic"
run_list(
  "recipe[nginx]",
  "recipe[mysql]"
)
