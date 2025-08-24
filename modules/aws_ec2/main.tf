data "aws_key_pair" "key" {
  key_name           = "optum_sravan_ubuntu"
  include_public_key = true

  filter {
    name   = "ami"
    values = ["ubuntu"]
  }
}
