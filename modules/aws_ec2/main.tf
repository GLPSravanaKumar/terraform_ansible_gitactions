data "aws_key_pair" "key" {
  key_name           = "optum_sravan_ubuntu"
  include_public_key = true

  filter {
    name   = "tag:ami"
    values = ["ubuntu"]
  }
}
data "aws_ami" "ami" {
  most_recent = true
  owners      = ["099720109477"] #Canonical #aws ec2 describe-images --region us-east-1 --image-ids ami-0360c520857e3138f

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250821"]
  }
}
resource "aws_instance" "public_servers" {
  count                       = length(var.public_subnet_cidrs)
  ami                         = data.aws_ami.ami.id
  instance_type               = var.instance_type
  key_name                    = data.aws_key_pair.key.key_name
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
