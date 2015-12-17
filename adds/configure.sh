#!/bin/bash

mkdir /var/run/sshd
mkdir -p /root/.ssh
chmod 700 /root/.ssh
#mv /authorized_keys /root/.ssh/.
#chmod 600 /root/.ssh/*
chown -Rf root:root /root/.ssh


useradd -m france
mkdir -p /home/france/.ssh
chmod 700 /home/france/.ssh
mv /authorized_keys /home/france/.ssh/.
chmod 600 /home/france/.ssh/*
chown -Rf france:france /home/france/.ssh

# configure sshd to block authentication via password
sed -i.bak 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
rm /etc/ssh/sshd_config.bak


