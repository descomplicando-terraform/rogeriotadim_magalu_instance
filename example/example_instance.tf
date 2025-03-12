resource "random_string" "random" {
  length  = 5
  special = false
}

locals {
  sufix = lower(random_string.random.result)
}

# module "vpc" {
#   source = "git::https://github.com/descomplicando-terraform/rogeriotadim_magalu_vpc.git"
#   name   = "vpc-${local.sufix}"
# }

# module "subnetpool" {
#   source = "git::https://github.com/descomplicando-terraform/rogeriotadim_magalu_subnetpool.git"
#   name   = "subnetpool-${local.sufix}"
#   cidr   = "10.254.1.0/24"
# }

# locals {
#   subnets = {
#     "${cidrsubnet(module.subnetpool.subnetpool.cidr, 4, 0)}" : {
#       name          = "subnet-${local.sufix}"
#       description   = "Subnet ${local.sufix}"
#       vpc_id        = module.vpc.vpc.id
#       subnetpool_id = module.subnetpool.subnetpool.id
#     }
#   }
# }

# module "subnets" {
#   depends_on = [module.subnetpool, module.vpc]
#   source     = "git::https://github.com/descomplicando-terraform/rogeriotadim_magalu_subnet.git"
#   subnets    = local.subnets
# }

module "instances_key" {
  source = "git::https://github.com/descomplicando-terraform/rogeriotadim_magalu_ssh_key_pair.git"
  name   = "key-test-${local.sufix}"
  key    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCnLfzn4UL6zc7OqXQdzaB9mTzBmy9C6EO7yC6UVpwoQNQWIyn0vr4Ds9Hma75cjfwMn91qmBnquA/8YyhSOm5/9P+5Qlow9o/v5KeC07xzqUpEMYS/1AYY4bCzYtsLNDAa2kYWvZp6Rx1uTKDIy/1nb2nQOOjIdo6aTrooVzsUGZMzgBcO46rnINmBmpeGeMkZflK5ZE4Dq2D1aUZefYsszCUO4xI1hfibxCbReW8ic15k+ZKQGnvFvCF7+sLIEUSydBUGk8EVgjIzY75TCWsOpwfh689B2lx8qVYHudGsgdGus4fiQpmofnCjkeCN4ILn8o/oxjml9vqksWxPdpQnyaZ8kys7egwqGSR3xBoX6bEJ6YmyAp8q2JaYLPsIJQkz27hZ3vHA1kolRgvngRiLJalCHkuJawZ6HJLaahrTEzaVwyP+DGJ2UMSGkLRvNFD/RxxcKQNLXBo88HusnB+h3+JJzm6Hr6RIUBM8TjsB+MpXYwIBIaqrRKOgzuYWdFRhro+50iBL2ZeH4lvVdNtYKCxZZabSIt9JcvYe5M87rzj2EhuZvFloWtB/rxIliAqzWJJ8d5xz20w4Wknid3xF6OyIQQ8M7pKoucB1E205Q2R0sjfVYH8uinCU/nkjopKdXdQjPcU7ghcmkEoo4HBrZSiFsUJaFbcH42Xzvdf2NQ== rogeriotadim@gmail.com"
}

module "instances" {
  # depends_on    = [module.instances_key, module.subnets]
  depends_on    = [module.instances_key]
  source        = "../"
  name          = var.name
  image         = "cloud-ubuntu-24.04 LTS"
  machine_type  = "BV1-1-10"
  qtd_instances = var.qtd_instances
  # vpc_id        = module.vpc.vpc.id
  ssh_key_name = module.instances_key.instances_key.name
}

output "instances_name" {
  value = module.instances.instances[*].name
}