## Lab-4 Description 

  Install and configure Ansible Automation Platform on control nodes, create inventories of 2 managed hosts, and then perform ad-hoc commands to check functionality.

## steps 
 1. **Install Ansible**
 2. **Configure Ansible**
 3. **add hosts in inventory file**
 4. **Configure SSH Access**
 5. **Perform Ad-hoc Commands**

## Solution Steps

### Step1: Install Ansible
```
 sudo apt-get install ansible
```
### Step2: Configure Ansible
mkdir -p ~/ansible
cd ~/ansible
vim hosts

### Step3: add hosts in inventory file
```
[managed]
managed_host
```

### Step4: Configure SSH Access
ssh-keygen
ssh-copy-id your_user@managed_host

### Step5: Perform Ad-hoc Commands
```
ansible -i hosts managed -m ping
ansible -i hosts managed -m shell -a 'df -h'
ansible -i hosts managed -m shell -a 'uptime'
```
