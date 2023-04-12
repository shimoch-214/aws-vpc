module "vpc" {
  source = "./modules"

  service_name = "test"
  redundancy   = 1
}
