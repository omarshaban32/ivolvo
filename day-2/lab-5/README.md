## Lab-5 Description  

  Write an Ansible playbook to automate the configuration of a web server. Configure Apache/Nginx, deploy a sample website and ensure proper security settings.

## steps 
 1. **Install Ansible**
 2. **Configure Ansible**
 3. **add hosts in inventory file**
 4. **Configure AWS AccessKey**
 5. **run playbook**

## Solution Steps

### Step1: Install Ansible
```
 sudo apt-get install ansible
```
### Step2: Configure Ansible
```
mkdir -p ~/ansible
cd ~/ansible
vim inventory
```

### Step3: add hosts in inventory file
```
[servers]
web
```
### Step4: Configure AWS AccessKey

#### Run 
  ```
  aws configure
  ```
#### Enter AccessKey ID and SecretAccessKey

### Step5: run playbook
```
  ansible-playbook -i inventory playbook.yaml
```

