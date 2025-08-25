resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "internet-gateway"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    name = "public-rt"
  }
  depends_on = [var.public_subnet_ids]
}

resource "aws_eip" "eip" {
  count  = length(var.public_subnet_cidrs)
  domain = "vpc"
  tags = {
    Name = "Eip"
  }
}
resource "aws_nat_gateway" "nat_gw" {
  count         = length(var.public_subnet_cidrs)
  allocation_id = aws_eip.eip[count.index].id
  subnet_id     = element(var.public_subnet_ids, count.index)

  tags = {
    Name = "Nat-Gw"
  }
  depends_on = [aws_internet_gateway.igw, var.public_subnet_ids]
}

resource "aws_route_table_association" "public_rt_association" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(var.public_subnet_ids, count.index)
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw[0].id
  }

  tags = {
    name = "private-rt"
  }
  depends_on = [var.private_subnet_ids]
}
resource "aws_route_table_association" "private_rt_association" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = element(var.private_subnet_ids, count.index)
  route_table_id = aws_route_table.private_rt.id
}
