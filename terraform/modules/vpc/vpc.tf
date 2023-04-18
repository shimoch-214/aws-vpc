resource "aws_vpc" "this" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "${local.service_name}-vpc"
  }
}
