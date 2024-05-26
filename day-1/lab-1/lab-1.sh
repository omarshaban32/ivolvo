#!/bin/bash

sudo adduser webadmin
sudo usermod -aG webgroup webadmin
sudo visudo
%webadmin ALL=(ALL) NOPASSWD: /usr/bin/apt-get install apache2
su - webadmin
sudo apt-get update
sudo apt-get install apache2

