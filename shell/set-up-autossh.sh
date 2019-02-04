#!/bin/sh

# Sets up an AutoSSH reverse SSH tunnel on the host
# $1 is the IP address of the client
# $2 is the client's SSH port
# $3 is the host's SSH port

sudo apt install -y openssh-server autossh

sudo sed -i "s/Port\ 22/Port\ $2/g" /etc/ssh/sshd_config
sudo ufw enable
sudo ufw allow $2/tcp

sudo useradd -m -s /sbin/nologin autossh
sudo -H -u autossh -s bash -c 'ssh-keygen -t ed25519'
sudo -H -u autossh -s bash -c "ssh-copy-id $1 -p $2"

cron_string="@reboot /bin/sudo -u autossh bash -c '/usr/local/bin/autossh -M 0 -f autossh@$1 -p $2 -N -o 'ExitOnForwardFailure=yes' -o 'ServerAliveInterval 60' -o 'ServerAliveCountMax 3' -R $3:localhost:$2'"
sudo bash -c "(crontab -l 2>/dev/null; echo '$cron_string') | crontab -"
