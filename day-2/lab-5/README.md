## Lab-5 Description  

  Write an Ansible playbook to automate the configuration of a web server. Configure Apache/Nginx, deploy a sample website and ensure proper security settings.

## web server

![](https://github.com/omarshaban32/ivolvo/blob/main/day-2/lab-5/screenshot/web.png)


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

  ```
  aws configure
  ```
#### Enter AccessKey ID and SecretAccessKey

### apache_setup.yml
```
---
- name: Configure Apache Web Server
  hosts: webservers
  become: yes
  vars:
    sample_site_content: "<html><body><h1>Welcome to Apache Web Server from ivolve</h1></body></html>"

  tasks:
    - name: Install Apache
      apt:
        name: apache2
        state: present
        update_cache: yes

    - name: Start and enable Apache service
      systemd:
        name: apache2
        state: started
        enabled: yes

    - name: Deploy sample website
      copy:
        content: "{{ sample_site_content }}"
        dest: /var/www/html/index.html

    - name: Set proper permissions on web root
      file:
        path: /var/www/html
        state: directory
        owner: www-data
        group: www-data
        mode: '0755'

    - name: Ensure UFW is installed
      apt:
        name: ufw
        state: present
        update_cache: yes

    - name: Allow 'Apache Full' profile in UFW
      ufw:
        rule: allow
        name: 'Apache Full'

```

### Step5: run playbook
```
  ansible-playbook -i inventory playbook.yaml
```
#### playbook
![](https://github.com/omarshaban32/ivolvo/blob/main/day-2/lab-5/screenshot/run.png)

#### ssh to web server
![](https://github.com/omarshaban32/ivolvo/blob/main/day-2/lab-5/screenshot/ssh.png)

#### website
![](https://github.com/omarshaban32/ivolvo/blob/main/day-2/lab-5/screenshot/website.png)



