module "vpc" {
  source = "./modules/vpc"

  service_name = "test"
  redundancy   = 1
}
