resource "aws_subnet" "public" {
  for_each          = toset(local.az)
  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.value
  cidr_block        = "172.16.${index(local.az, each.value) + 1}0.0/24"
  tags = {
    Name = "${local.service_name}-public-${each.value}"
  }
}

resource "aws_subnet" "private" {
  for_each          = toset(local.az)
  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.value
  cidr_block        = "172.16.1${index(local.az, each.value) + 1}0.0/24"
  tags = {
    Name = "${local.service_name}-private-${each.value}"
  }
}
