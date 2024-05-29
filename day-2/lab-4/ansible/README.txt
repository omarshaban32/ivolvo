Lab 4: Ansible Installation Objective: Install and configure Ansible Automation Platform on control nodes, create inventories of 2 managed hosts, and then perform ad-hoc commands to check functionality.


1. Install Ansible:
sudo apt-get install ansible

2: Configure Ansible
mkdir -p ~/ansible
cd ~/ansible
vim hosts

in hosts :
[managed]
managed_host_1

3: Configure SSH Access
ssh-keygen
ssh-copy-id your_user@managed_host_1

4: Perform Ad-hoc Commands
ansible -i hosts managed -m ping
ansible -i hosts managed -m shell -a 'df -h'
ansible -i hosts managed -m shell -a 'uptime'

