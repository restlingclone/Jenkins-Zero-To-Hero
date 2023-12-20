#!/bin/bash

# Install Sonarqube server setup on ubuntu 22 and latest.
#Update the server and install dependencies package.
DEBIAN_FRONTEND=noninteractive apt update -y;
DEBIAN_FRONTEND=noninteractive apt install unzip -y;

# Add sonarqube user and install sonarqube with latest community version.
# Define username as sonarqube, here you can change the password as per your need.
username=sonarqube
password=admin
# Now create the user with password
adduser $username --disabled-password --gecos Sonarqube;
echo "$username:$password" | chpasswd ;
echo Sonarqube: $username has been created with password: $password ;
# Sonarqube: sonarqube has been created with password: admin
sudo su - sonarqube ;

#Install sonarqube and start the setup.
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.3.79811.zip ;
sudo unzip * ;
sudo chmod -R 755 /home/sonarqube/sonarqube-9.4.0.54424 ; 
sudo chown -R sonarqube:sonarqube /home/sonarqube/sonarqube-9.4.0.54424 ; 
sudo cd sonarqube-9.4.0.54424/bin/linux-x86-64/ ; 
sudo ./sonar.sh start

# Sonarqube steup is done, login onto your browser with URL http://<public-ip-address>:9000 and allow 9000 port in your security group.
# Username and password is admin to first time login.