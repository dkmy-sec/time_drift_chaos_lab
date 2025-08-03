#!/bin/bash
apt-get update
apt-get install -y rsyslog
timedatectl set-ntp false
date -s "+5 minutes"
echo "*.* @192.168.56.10:514" >> /etc/rsyslog.conf
systemctl restart rsyslog
