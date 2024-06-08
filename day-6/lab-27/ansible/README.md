## Lab5 Description 

 Ansible Roles for Application Deployment Objective: Organize Ansible playbooks using roles. Create an Ansible role for installing Jenkins, docker, openshift CLI 'OC'.

### Steps 
1. **Create the folder structure As following**
2. **Configure AWS AccessKey**
3. **Run Playbook**
4. **Check the Configuration that you apply in the EC2**

## Server
### you can add the server to the inventory or use aws_ec2.yml plugin by apply this command

  ```
     ansible-playbook -i ./aws_ec2.yml playbook.yml
  ```
 ![](https://github.com/omarshaban32/ivolvo/blob/main/day-6/lab-27/ansible/screenshot/server.png)

 


## Solution Steps

### Step1: Create the folder structure As following

  #### create the following files

  ![](https://github.com/omarshaban32/ivolvo/blob/main/day-6/lab-27/ansible/screenshot/Tree.png)
 
### Step2: Configure AWS AccessKey

#### Run 
  ```
  aws configure

  ```
#### Enter AccessKey ID and SecretAccessKey

  ![](https://github.com/omarshaban32/ivolvo/blob/main/day-6/lab-27/ansible/screenshot/aws-config.png)


### Step3: Run Playbook
#### First run 
```
  ansible-playbook -i inventory_file playbook.yaml
```

![](https://github.com/omarshaban32/ivolvo/blob/main/day-6/lab-27/ansible/screenshot/run-1.png)
![](https://github.com/omarshaban32/ivolvo/blob/main/day-6/lab-27/ansible/screenshot/run-2.png)
![](https://github.com/omarshaban32/ivolvo/blob/main/day-6/lab-27/ansible/screenshot/run-3.png)



### Step4: Check the Configuration that you apply in the EC2
#### Enter on your EC2 instance by ssh command and check 
```
  ssh -i keypair.pem  ubuntu@public-ip
```
![](https://github.com/omarshaban32/ivolvo/blob/main/day-6/lab-27/ansible/screenshot/ssh.png)


#### docker ps
  ![](https://github.com/omarshaban32/ivolvo/blob/main/day-6/lab-27/ansible/screenshot/docker.png)

#### jenkins status
![](https://github.com/omarshaban32/ivolvo/blob/main/day-6/lab-27/ansible/screenshot/jenkins.png)
![](https://github.com/omarshaban32/ivolvo/blob/main/day-6/lab-27/ansible/screenshot/jenkins-2.png)

#### OC cli
  ![](https://github.com/omarshaban32/ivolvo/blob/main/day-6/lab-27/ansible/screenshot/oc.png)

  
