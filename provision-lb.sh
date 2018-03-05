#!/bin/bash
yum -y install unzip
cd /usr/local/bin
curl -kL https://github.com/fabiolb/fabio/releases/download/v1.5.8/fabio-1.5.8-go1.10-linux_amd64 -o fabio
chmod 755 fabio
setcap 'cap_net_bind_service=+ep' $(which fabio)
cp /vagrant/fabiolb.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable fabiolb
systemctl start fabiolb