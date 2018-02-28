#!/bin/bash
curl -o /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum -y install jenkins unzip
cd /usr/local/bin
curl https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_linux_amd64.zip?_ga=2.4148528.1226994676.1519757304-143675721.1493837978 -L -o consul.zip
unzip consul.zip
rm -f consul.zip
mkdir -p /etc/consul.d
yum -y install java-1.8.0-openjdk
systemctl start jenkins
sleep 30
cat /var/lib/jenkins/secrets/initialAdminPassword