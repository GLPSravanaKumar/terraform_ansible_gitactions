/* output "keypair_id" {
  value = data.aws_key_pair.key.key_pair_id
} */
output "ami_image_id" {
  value = data.aws_ami.redhat.id
}
output "aws_instance_id" {
  value = aws_instance.public_servers[*].id
}
output "public_server_ip" {
  value = aws_instance.public_servers[*].public_ip
}
output "private_server_ip" {
  value = aws_instance.private_servers[*].private_ip
}
