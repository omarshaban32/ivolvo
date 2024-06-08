## Lab-1 Description 

  Create a new user, assign it to a specific group, and configure permissions to allow the user to install a web server with elevated privileges using . sudo tool

### lab-1.sh 
```
sudo adduser webadmin
sudo usermod -aG webgroup webadmin
sudo visudo                     # %webadmin ALL=(ALL) NOPASSWD: /usr/bin/apt-get install apache2
su - webadmin
sudo apt-get update
sudo apt-get install apache2
```
### you will install web server without password

