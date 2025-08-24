output "keypair_id" {
  value = data.aws_key_pair.key.key_pair_id
}
output "ami_image_id" {
  value = data.aws_ami.ami.image_id
}
