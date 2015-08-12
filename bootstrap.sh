#!/bin/sh
# Create keys folder
mkdir keys
# Create local cache folder for squid
mkdir -p $HOME/.squid/dk1
# Copy user public key to vagrant and then to guests
cp $HOME/.ssh/id_rsa.pub keys/id_rsa.pub
# Init the vms
vagrant up
# Provision the bootstrap vm
ansible-playbook -i hosts site.yml -t bootstrap
# Provision the other vms
ansible-playbook -i hosts site.yml
