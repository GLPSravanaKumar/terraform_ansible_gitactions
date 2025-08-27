locals {
  ami_map = {
    amazon_linux = data.aws_ami.amazon_linux.id
    ubuntu       = data.aws_ami.ubuntu.id
    redhat       = data.aws_ami.redhat.id
  }
  keypair_map = {
    amazon_linux = data.aws_key_pair.amazon_linux.key_name
    ubuntu       = data.aws_key_pair.ubuntu.key_name
    redhat       = data.aws_key_pair.redhat.key_name
  }
}

resource "aws_instance" "public_servers" {
  count                       = length(var.public_subnet_cidrs)
  ami                         = lookup(local.ami_map, var.ami)
  instance_type               = var.instance_type
  key_name                    = lookup(local.keypair_map, var.ami)
  subnet_id                   = element(var.public_subnet_ids, count.index)
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.pub_sg_id]
  user_data                   = <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y apache2
    systemctl start apache2
    systemctl enable apache2
    echo "<h1>Hello from Terraform!</h1>" > /var/www/html/index.html
  EOF
  tags = {
    Name = "public_webserver-${count.index + 1}"
  }
}

resource "aws_instance" "private_servers" {
  count                       = length(var.private_subnet_cidrs)
  ami                         = lookup(local.ami_map, var.ami)
  instance_type               = var.instance_type
  subnet_id                   = element(var.private_subnet_ids, count.index)
  key_name                    = lookup(local.keypair_map, var.ami)
  associate_public_ip_address = false
  vpc_security_group_ids      = [var.private_sg_id]
  tags = {
    Name = "private_webserver-${count.index + 1}"
  }
}
