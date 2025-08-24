output "public_route_table_ids" {
  value = aws_route_table.public_rt[*].id
}
output "private_route_table_ids" {
  value = aws_route_table.private_rt[*].id
}
output "nat_gw_ids" {
  value = aws_nat_gateway.nat_gw[*].id
}
