#title: converts the first letter of each word in the given string to uppercase.

/* output "keypair_id" {
  value = data.aws_key_pair.key.key_pair_id
} */
output "ami_image_id" {
  description = title("Get instance Ami image ID")
  value       = data.aws_ami.redhat.id
}
output "aws_instance_id" {
  description = title("Get list of active running instance  Ids")
  value       = aws_instance.public_servers[*].id
}
output "public_server_ip" {
  description = title("list of instace public server Ids")
  value       = aws_instance.public_servers[*].public_ip
}
output "private_server_ip" {
  description = title("list of instace private server Ids")
  value       = aws_instance.private_servers[*].private_ip
}
