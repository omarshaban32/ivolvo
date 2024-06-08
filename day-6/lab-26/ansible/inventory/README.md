## Lab-26 Description 

 Ansible Dynamic Inventories Objective: Set up Ansible dynamic inventories to automatically discover and manage infrastructure. Use dynamic inventories to scale playbook execution across different environments.

## servers

![](https://github.com/omarshaban32/ivolvo/blob/main/day-6/lab-26/ansible/inventory/screenshots/Screenshot%202024-06-02%20230420.png)

### Steps 
1. **Create the folder structure As following**
2. **Configure AWS AccessKey**
3. **Dynamic inventory using AWS ec2 Plugin**



## Solution Steps

### Step1: Create the folder structure As following 

  #### create the following files and see the graph of the aws-ec2 plugin by 
  ```
  ansible-inventory -i aws_ec2.yml --graph
  ```

  ![](https://github.com/omarshaban32/ivolvo/blob/main/day-6/lab-26/ansible/inventory/screenshots/Screenshot%202024-06-02%20230358.png)
 
### Step2: Configure AWS AccessKey

   #### Run 
  ```
  aws configure

  ```
#### Enter AccessKey ID and SecretAccessKey 
 
### Step3: Dynamic inventory using AWS ec2 Plugin
#### First add path to ansible.cfg file
```

[defaults]
inventory = ~/ivolvo/ivolvo/day-6/lab-26/ansible/inventory/aws_ec2.yml

```
#### create aws_ec2.yaml file as follow

```
plugin: amazon.aws.aws_ec2
regions:
  - us-east-1
filters:
  instance-state-name: running
keyed_groups:
  - key: tags.Name
    prefix: name_
  - key: tags.Environment
    prefix: env_

```
### Run Playbook
#### playbook.yml update packages on dev servers by Environment tag

```
---
- name: Update packages on dev Environment
  hosts: all
  become: true
  vars:
    ansible_python_interpreter: /usr/bin/python3.9
  tasks:
    - name: Update packages on dev servers
      yum:
        name: '*'
        state: latest
      when: hostvars[inventory_hostname]['tags']['Environment'] == 'dev'

```
#### run playbook
```
    ansible-playbook -i aws_ec2.yml playbook.yaml
```

![](https://github.com/omarshaban32/ivolvo/blob/main/day-6/lab-26/ansible/inventory/screenshots/Screenshot%202024-06-02%20230715.png)

#### then you can ssh to the server and see the updates by 

```
  ssh -i keypair.pem  ec2-user@public-ip
```





  
