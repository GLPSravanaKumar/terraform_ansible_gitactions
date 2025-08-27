resource "null_resource" "configure_server" {
  count = length(var.public_subnet_cidrs)
  triggers = {
    instance_id = "module.aws_ec2.aws_instance_id"  
  }
  provisioner "file" {
    source      = "requirements.sh"
    destination = "/tmp/requirements.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("optum_sravan_ubuntu.pem")
      host        = element(module.aws_ec2.public_server_ip, count.index)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/requirements.sh",
      "sudo /tmp/requirements.sh",
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("optum_sravan_ubuntu.pem")
      host        = element(module.aws_ec2.public_server_ip, count.index)
    }
  }

  provisioner "local-exec" {
    command = <<EOH
      echo ${element(module.aws_ec2.public_server_ip, count.index)} >> servers_list.txt
    EOH
  }
}
