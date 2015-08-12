#!/bin/sh

# Create folder for keys
mkdir keys
# Create local cache folder for squid
mkdir -p $HOME/.squid/dk1
# Copy user public key to vagrant and then to guests
cp $HOME/.ssh/id_rsa.pub keys/id_rsa.pub
