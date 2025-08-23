output "public_subnet_id" {
  value = aws_subnet.public_subnets[*].cidr_block
}
output "private_subnet_id" {
  value = aws_subnet.private_subnets[*].cidr_block
}
