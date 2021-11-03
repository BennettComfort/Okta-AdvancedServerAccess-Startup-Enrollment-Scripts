#!/bin/bash
sudo mkdir -p /var/lib/sftd
echo "${ENROLLMENTOKEN}" | sudo tee /var/lib/sftd/enrollment.token
sudo mkdir -p /etc/sft
echo "CanonicalName: ${SERVERNAME}" | sudo tee /etc/sft/sftd.yaml
echo "Bastion: ${GATEWAYNAME}" >> /etc/sft/sftd.yaml
echo 'deb http://pkg.scaleft.com/deb linux main' | sudo tee -a /etc/apt/sources.list
curl -C - https://dist.scaleft.com/pki/scaleft_deb_key.asc | sudo apt-key add -
sudo echo "CASignatureAlgorithms ssh-rsa" >> /etc/ssh/sshd_config
sudo apt-get update
sudo apt-get install scaleft-server-tools