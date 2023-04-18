# public
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${local.service_name}-public-route-table"
  }
}

resource "aws_route" "public" {
  destination_cidr_block = "0.0.0.0/0"

  route_table_id = aws_route_table.public.id
  gateway_id     = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public" {
  for_each = toset(local.az)

  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.public.id
}

# private
resource "aws_route_table" "private" {
  for_each = toset(local.az)
  vpc_id   = aws_vpc.this.id

  tags = {
    Name = "${local.service_name}-private-${each.value}-route-table"
  }
}

resource "aws_route" "private" {
  for_each               = toset(local.az)
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.private[each.key].id
  nat_gateway_id         = aws_nat_gateway.this[each.key].id
}

resource "aws_route_table_association" "private" {
  for_each       = toset(local.az)
  subnet_id      = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.private[each.key].id
}
