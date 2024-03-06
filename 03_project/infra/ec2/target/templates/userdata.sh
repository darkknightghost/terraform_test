#!/bin/bash

sudo apt update -y
sudo apt install -y docker.io openjdk-17-jdk git ruby wget unzip 

cd /home/ubuntu

# aws cli 설치
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install zip unzip -y
unzip awscliv2.zip
./aws/install

# JAVA_HOME 설정
echo 'export JAVA_HOME="/usr/lib/jvm/java-1.17.0-openjdk-amd64"' >> ./.bashrc
echo "export PATH=$PATH:$JAVA_HOME/bin" >> ./.bashrc
source ./.bashrc

# codedeploy-agent 설치
wget https://aws-codedeploy-ap-northeast-2.s3.amazonaws.com/latest/install
chmod u+x ./install
sudo ./install auto
sudo service codedeploy-agent status
rm -rf ./install

cat >/etc/init.d/codedeploy-start.sh <<EOL
#!/bin/bash
sudo service codedeploy-agent restart
EOL
sudo chmod +x /etc/init.d/codedeploy-start.sh

set -euf pipefail

# Download and install
sudo curl -L "https://github.com/docker/compose/releases/download/v2.1.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# docker 설정
sudo usermod -aG docker ubuntu
sudo systemctl enable docker
sudo systemctl start docker

