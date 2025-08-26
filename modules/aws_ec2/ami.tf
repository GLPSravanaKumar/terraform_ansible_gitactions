# Ubuntu
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] #Canonical #aws ec2 describe-images --region us-east-1 --image-ids ami-0360c520857e3138f

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250821"]
  }
}
# Amazon linux
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*.*.*.*-x86_64"]
  }
}
# RedHat
data "aws_ami" "redhat" {
  most_recent = true
  owners      = ["309956199498"] # RedHat official

  filter {
    name   = "name"
    values = ["RHEL-10.0.0_HVM-20250730-x86_64-0-Hourly2-GP3"]
  }
}
