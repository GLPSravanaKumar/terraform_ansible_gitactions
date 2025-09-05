# Public Servers
[public_servers]
%{ for i, ip in public_servers ~}
public_server_${i + 1} ansible_port=22 ansible_user=ubuntu ansible_ssh_private_key_file=glpskey ansible_host=${ip}
%{ endfor ~}

# Private Servers
[private_servers]
%{ for i, ip in private_servers ~}
private_server_${i + 1} ansible_port=22 ansible_user=ubuntu ansible_ssh_private_key_file=glpskey  ansible_host=${ip}
%{ endfor ~}