#title: converts the first letter of each word in the given string to uppercase.
output "public_route_table_ids" {
  description = title("to get list of public Route table Ids")
  value       = aws_route_table.public_rt[*].id
}
output "private_route_table_ids" {
  description = title("to get list of private Route table Ids")
  value       = aws_route_table.private_rt[*].id
}
output "nat_gw_ids" {
  description = title("value of Nat Gatewat Ids")
  value       = aws_nat_gateway.nat_gw[*].id
}
