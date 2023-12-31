# Install Sonarqube server setup on ubuntu 22 and latest.
#Update the server and install dependencies package.
sudo DEBIAN_FRONTEND=noninteractive apt update -y;
sudo DEBIAN_FRONTEND=noninteractive apt install unzip -y;

# Add sonarqube user and install sonarqube with latest community version.
# Define username as sonarqube
username=sonarqube
password=admin
# Now create the user with password
sudo adduser $username --disabled-password --gecos Sonarqube
echo "$username:$password" | sudo chpasswd
echo Sonarqube: $username has been created with password: $password
# Sonarqube: sonarqube has been created with password: admin
sudo su - sonarqube
#Install sonarqube and start the setup.
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.3.79811.zip
unzip * 
chmod -R 755 /home/sonarqube/sonarqube-9.9.3.79811
chown -R sonarqube:sonarqube /home/sonarqube/sonarqube-9.9.3.79811 
cd sonarqube-9.9.3.79811/bin/linux-x86-64
 ./sonar.sh start

# Sonarqube steup is done, login onto your browser with URL http://<public-ip-address>:9000 and allow 9000 port in your security group.
# Username and password is admin to first time login.