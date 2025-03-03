resource "random_string" "random" {
  length  = 5
  special = false
}

module "instances_key" {
  source = "../../ssh_key_pair"
  name   = "key-test-${lower(random_string.random.result)}"
  key    = file("../../ssh_key_pair/example/ssh/id_rsa.pub")
}


module "instances" {
  depends_on    = [module.instances_key]
  source        = "../"
  name          = "instance-test-${lower(random_string.random.result)}"
  image         = "cloud-ubuntu-24.04 LTS"
  ssh_key_name  = module.instances_key.instances_key.name
  machine_type  = "BV1-1-10"
  qtd_instances = var.qtd_instances
  vpc_id        = data.mgc_network_vpc.vpc.id

}

output "instances_id" {
  value = module.instances.instances[*].id
}