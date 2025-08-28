# Public Servers
[public_servers]
public_server_1 ansible_port=22 ansible_user=ubuntu ansible_ssh_private_key_file=optum_sravan_ubuntu.pem 
ansible_host=${public_server_1}
public_server_2 ansible_port=22 ansible_user=ubuntu ansible_ssh_private_key_file=optum_sravan_ubuntu.pem
ansible_host=${public_server_2}
public_server_3 ansible_port=22 ansible_user=ubuntu ansible_ssh_private_key_file=optum_sravan_ubuntu.pem
ansible_host=${public_server_3}
public_server_4 ansible_port=22 ansible_user=ubuntu ansible_ssh_private_key_file=optum_sravan_ubuntu.pem
ansible_host=${public_server_4}

# Grouping both together
[all_servers:children]
public_servers
