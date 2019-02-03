#!/bin/sh

# Sets up an AutoSSH reverse SSH tunnel on the host
# $1 is the username of the client
# $2 is the IP address of the client
# $3 is the client's SSH port
# $4 is the host's SSH port

sudo apt install -y autossh

sudo useradd -m -s /sbin/nologin autossh
sudo su - autossh -s /bin/bash

ssh-keygen -t ed25519
ssh-copy-id $2 -p $3

autossh -M 0 $1@$2 -p $3 -N -R $4:localhost:$3
