data "aws_key_pair" "key" {
  key_name           = "optum_sravan_ubuntu"
  include_public_key = true

  filter {
    name   = "tag:ami"
    values = ["ubuntu"]
  }
}
data "aws_ami" "ami" {
  owners = ["099720109477"] #aws ec2 describe-images --region us-east-1 --image-ids ami-0360c520857e3138f

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250821"]
  }
}
