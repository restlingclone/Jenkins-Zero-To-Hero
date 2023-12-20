# Install Java latest version on ubuntu server.

sudo DEBIAN_FRONTEND=noninteractive apt install openjdk-17-jre -y ; sudo java -version ;

#Java is installed with version of jdk 17.

# Install Jenkins on ubuntu server 22 and latest.
# import the Jenkins GPG key from Jenkins repository
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key ;

# configure Jenkins repository to the sources list file echo and tee command.
sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null ;

# update the system’s package list.
sudo DEBIAN_FRONTEND=noninteractive apt-get update -y ;

# And install Jenkins.
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y jenkins ;

# Once the installation is complete, Jenkins should start automatically. To confirm this, run the command:
sudo systemctl status jenkins;

# Jenkins setup done successful run command http://<public ip address>:8080 and open port no. 8080 under Security group as per your need.

# Install Docker Slave Configuration on ubuntu 22 and latest server
# Run the below command to Install Docker
sudo DEBIAN_FRONTEND=noninteractive apt update;
sudo DEBIAN_FRONTEND=noninteractive apt install docker.io -y;

#Grant Jenkins user and Ubuntu user permission to docker daemon.
sudo usermod -aG docker jenkins ; 
sudo usermod -aG docker ubuntu ; 
sudo systemctl restart docker ; 
sudo systemctl status docker ;

# Docker Slave setup done.