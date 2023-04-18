resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${local.service_name}-igw"
  }
}

resource "aws_eip" "this" {
  for_each = toset(local.az)
  vpc      = true

  tags = {
    Name = "${local.service_name}-${each.value}-eip"
  }
}

resource "aws_nat_gateway" "this" {
  for_each      = toset(local.az)
  subnet_id     = aws_subnet.public[each.key].id
  allocation_id = aws_eip.this[each.key].id

  tags = {
    Name = "${local.service_name}-${each.value}-natgw"
  }

  depends_on = [
    aws_internet_gateway.this
  ]
}
