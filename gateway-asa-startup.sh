#!/bin/bash
#install all required agents
sudo mkdir -p /etc/sft
echo "SetupToken: ${GATEWAYTOKEN}" | sudo tee /etc/sft/sft-gatewayd.yaml
echo "CanonicalName: ${SERVERNAME}" | sudo tee /etc/sft/sftd.yaml
echo 'deb http://pkg-testing.scaleft.com/deb linux main' | sudo tee -a /etc/apt/sources.list
curl -C - https://dist.scaleft.com/pki/scaleft_deb_key.asc | sudo apt-key add -
sudo mkdir -p /var/lib/sftd
echo "${ENROLLMENTTOKEN}" | sudo tee /var/lib/sftd/enrollment.token
sudo echo "CASignatureAlgorithms ssh-rsa" >> /etc/ssh/sshd_config
sudo service sshd restart
sudo apt-get update
sudo apt-get install scaleft-gateway scaleft-server-tools scaleft-client-tools asciinema