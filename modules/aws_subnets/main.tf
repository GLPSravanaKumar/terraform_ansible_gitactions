resource "aws_subnet" "public_subnets" {
  count                   = lengh(var.public_subnet_cidrs)
  cidr_block              = var.public_subnet_cidrs[count.index]
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.vpc.id
  depends_on              = [aws_vpc.vpc]
  tags = {
    subnet = "Public Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count                   = lengh(var.private_subnet_cidrs)
  cidr_block              = var.private_subnet_cidrs[count.index]
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.vpc.id
  depends_on              = [aws_vpc.vpc]
  tags = {
    subnet = "Private Subnet ${count.index + 1}"
  }
}
