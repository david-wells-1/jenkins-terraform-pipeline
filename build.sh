#!/bin/sh

yum -y update
yum -y install epel-release

# install aws cli
yum -y install python-pip
pip install --upgrade pip
pip install awscli --upgrade --user
echo "PATH=~/.local/bin:$PATH" >> ~/.bash_profile
. ~/.bash_profile

# install docker
yum -y install yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker-ce
systemctl start docker
systemctl enable docker

# install git
yum -y install git

# install jenkins
yum -y install java-1.8.0-openjdk.x86_64 wget
cp /etc/profile /etc/profile_backup
echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' | sudo tee -a /etc/profile
echo 'export JRE_HOME=/usr/lib/jvm/jre' | sudo tee -a /etc/profilesource /etc/profile
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
yum -y install jenkins
systemctl start jenkins.service
systemctl enable jenkins.service
usermod -a -G docker jenkins
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --zone=public --permanent --add-port=8080/tcp
firewall-cmd --reload
