#!/bin/bash
curl -o /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum -y install jenkins unzip
cd /usr/local/bin
curl https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_linux_amd64.zip?_ga=2.4148528.1226994676.1519757304-143675721.1493837978 -L -o consul.zip
unzip consul.zip
rm -f consul.zip
mkdir -p /etc/consul.d
cp /vagrant/consul-client.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable consul-client
systemctl start consul-client
yum -y install java-1.8.0-openjdk
systemctl start jenkins
sleep 30
cat /var/lib/jenkins/secrets/initialAdminPassword
cd /opt
curl -k -L https://github.com/prometheus/node_exporter/releases/download/v0.15.2/node_exporter-0.15.2.linux-amd64.tar.gz -o node_exporter-0.15.2.linux-amd64.tar.gz 
tar xvf node_exporter-0.15.2.linux-amd64.tar.gz
mv node_exporter-0.15.2.linux-amd64 node_exporter
cp /vagrant/node_exporter.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable node_exporter
systemctl start node_exporter

