#!/bin/bash
yum -y install unzip
cd /usr/local/bin
curl https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_linux_amd64.zip?_ga=2.4148528.1226994676.1519757304-143675721.1493837978 -L -o consul.zip
unzip consul.zip
rm consul.zip
cp /vagrant/consul-server.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable consul-server.service
systemctl start consul-server