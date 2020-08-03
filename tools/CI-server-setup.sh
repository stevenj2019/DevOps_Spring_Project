#!/bin/bash 

echo "Running Prerequisites"
sudo DEBIAN_FRONTEND=noninteractive apt-get update -qq < /dev/null > /dev/null
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq python-software-properties ca-certificates jq curl apt-transport-https lsb-release gnupg< /dev/null > /dev/null
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq nodejs git openjdk-8-jre maven< /dev/null > /dev/null

echo "Installing npm"
curl -sL https://deb.nodesource.com/setup_6.x | sudo bash

echo "Installing Azure-CLI"
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

echo "Installing kubectl"
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
mv kubectl /usr/local/bin/kubectl
chmod a+x /usr/local/bin/kubectl

echo "Install Docker"
curl https://get.docker.com | sudo bash

echo "Install Docker Compose"
version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Installing Terraform"
wget https://releases.hashicorp.com/terraform/0.12.12/terraform_0.12.12_linux_amd64.zip
unzip terraform_*_linux_*.zip
sudo mv terraform /usr/local/bin

echo "Refrshing Angular"
npm uninstall -g angular-cli @angular/cli
npm cache clean
npm install -g @angular/cli@latest

echo "Installing Testing Frameworks"
npm install karma 
npm install -g protractor

echo "Configuring Jenkins user"
sudo useradd -m -s /bin/bash jenkins
echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo usermod -aG docker jenkins 

echo "Installing Jenkins"
sudo su - jenkins -c "curl -L https://updates.jenkins-ci.org/latest/jenkins.war --output jenkins.war"
sudo tee /etc/systemd/system/jenkins.service << EOF > /dev/null
[Unit]
Description=Jenkins Server

[Service]
User=jenkins
WorkingDirectory=/home/jenkins
ExecStart=/usr/bin/java -jar /home/jenkins/jenkins.war

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl restart jenkins
sudo su - jenkins << EOF
until [ -f .jenkins/secrets/initialAdminPassword ]; do
    sleep 1
    echo "waiting for initial admin password"
done
until [[ -n "\$(cat  .jenkins/secrets/initialAdminPassword)" ]]; do
    sleep 1
    echo "waiting for initial admin password"
done
echo "initial admin password: \$(cat .jenkins/secrets/initialAdminPassword)"
EOF
echo "To-Do List"
echo "1. Sign into Azure CLI (az login)"
echo "2. Configure Azure Kubernetes Service"