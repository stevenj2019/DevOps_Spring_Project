#!/bin/bash 

echo "Running Prerequisites"
sudo useradd -m -s /bin/bash jenkins
sudo DEBIAN_FRONTEND=noninteractive apt-get update -qq < /dev/null > /dev/null
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq python-software-properties< /dev/null > /dev/null
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash –
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq nodejs git openjdk-8-jre maven< /dev/null > /dev/null
npm uninstall -g angular-cli @angular/cli
npm cache clean
npm install -g @angular/cli@latest
npm install karma 
npm install -g protractor

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