variable "instance_type" {
  description = "Type of EC2 instance"
}
variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}
variable "pub_sg_id" {
  description = "value of public security group id"
}
variable "public_subnet_cidrs" {
  description = "public subnet cidr values"
}
