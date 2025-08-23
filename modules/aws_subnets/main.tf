resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnet_cidrs)
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  map_public_ip_on_launch = true
  vpc_id                  = var.vpc_id
  depends_on              = [var.vpc_id]
  tags = {
    subnet = "Public Subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count                   = length(var.private_subnet_cidrs)
  cidr_block              = element(var.private_subnet_cidrs, count.index)
  map_public_ip_on_launch = false
  vpc_id                  = var.vpc_id
  depends_on              = [var.vpc_id]
  tags = {
    subnet = "Private Subnet-${count.index + 1}"
  }
}
