#!/bin/sh

# Sets up an AutoSSH reverse SSH tunnel on the host
# $1 is the IP address of the client
# $2 is the client's SSH port
# $3 is the host's SSH port

sudo apt install -y openssh-server autossh
sudo useradd -m -s /sbin/nologin autossh
sudo -H -u autossh -s bash -c 'ssh-keygen -t ed25519'
sudo -H -u autossh -s bash -c "ssh-copy-id $1 -p $2"
sudo -H -u autossh -s bash -c "autossh -M 0 autossh@$1 -p $2 -N -R $3:localhost:$2"
