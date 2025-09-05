/* data "aws_key_pair" "amazon_linux" {
  key_name = "optum_sravan_linux"
}
data "aws_key_pair" "ubuntu" {
  key_name = "optum_sravan_ubuntu"
}
data "aws_key_pair" "redhat" {
  key_name = "optum_sravan_redhat"
} */

#This resource will used to assign local generated key to ec2 pubkey
resource "aws_key_pair" "glpskey" {
  key_name   = "glpskey"
  public_key = file("${path.module}/id_ed25519_glpskumar.pub")
}
