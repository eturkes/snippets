#!/bin/sh

# Sets up an AutoSSH reverse SSH tunnel on the host
# $1 is the IP address of the client the host will connect to
# $2 is the client's SSH port
# $3 is the host's SSH port

sudo apt install -y autossh

sudo su - autossh -s /bin/bash
ssh-keygen -t ed25519
ssh-copy-id $1 -p $2

autossh -M 0 $1 -p $2 -N -R $3:localhost:$2
