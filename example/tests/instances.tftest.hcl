run "create_one_instance" {
variables {
  qtd_instances = 1
}

  command = apply

  assert {
    condition     = module.instances.instances[0].name != ""
    error_message = "invalid name"
  }
}

run "create_three_instancea" {
  command = apply

variables {
  qtd_instances = 3
}

  assert {
    condition     = module.instances.instances[0].name != ""
    error_message = "invalid name"
  }

}
