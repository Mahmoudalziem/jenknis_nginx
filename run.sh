#!/bin/bash
echo "========== Author : Mahmoud Abd Alziem =============="
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository -y\
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce
# Linux post-install
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker
#Docker Pull Jenkins Docker Image
docker pull azima/jenkins-docker
docker run -it -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock --name jenkins azima/jenkins-docker
#Linux Print Key Value
KEY_VALUE=`docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword`
echo "====================== AUTH KEY =========="
echo "KEY JENKINS : $KEY_VALUE"
echo "========================================="