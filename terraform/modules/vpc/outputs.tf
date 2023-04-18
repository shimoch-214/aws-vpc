output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = [for value in aws_subnet.public : value.id]
}
output "private_subnet_id" {
  value = [for value in aws_subnet.private : value.id]
}
