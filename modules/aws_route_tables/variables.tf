variable "vpc_id" {
  description = "Get value of vpc id"
}
variable "public_subnet_ids" {
  description = "Public subnet CIDR values"
}
variable "private_subnet_ids" {
  description = "private subnet cidr values"
}
variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
}
variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
}
