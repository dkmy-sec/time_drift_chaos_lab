#!/bin/bash
apt-get install -y ntp
timedatectl set-ntp true
ntpdate pool.ntp.org
echo "✅ Time resynced using NTP"
