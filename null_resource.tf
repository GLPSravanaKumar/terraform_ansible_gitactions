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
      user        = var.ami == "ubuntu" ? "ubuntu" : "ec2-user"
      private_key = file("~/.ssh/id_ed25519_glpskumar")
      host        = element(module.aws_ec2.public_server_ip, count.index)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sleep ${count.index * 20}", # wait 20s * index
      "sudo sed -i 's/\r$//' /tmp/requirements.sh",
      "sudo chmod +x /tmp/requirements.sh",
      "sudo /tmp/requirements.sh"
    ]
    connection {
      type        = "ssh"
      user        = var.ami == "ubuntu" ? "ubuntu" : "ec2-user"
      private_key = file("~/.ssh/id_ed25519_glpskumar")
      host        = element(module.aws_ec2.public_server_ip, count.index)
      timeout     = "2m"
    }
  }

  provisioner "local-exec" {
    command = <<EOH
      echo ${element(module.aws_ec2.public_server_ip, count.index)} >> servers_list.txt
    EOH
  }
}
