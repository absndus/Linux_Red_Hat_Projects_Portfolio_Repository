#!/bin/bash
#File: LinuxAdminKernelTuning.sh
#Date: 05/14/2023
#Version: 1.00
#Descriptions: This script asks the administrator several questions and will permanently tune the Red Hat Kernel in real-time without the need of restarting the server.

echo "Please enter 1 if you want to enable route verifications to prevent the system from accepting fake routes that could have potential harm to this Linux machine or 0 to leave it as default."
read RPID

echo "Please enter 1 if you want to stop the syn flood from occuring or 0 to leave it as default."
read COID

echo "Please enter 1 if you want to allow the interfaces of this machine to forward packets or 0 for forward prevention."
read FORID

echo "Please enter 1 if you want to prevent users from rebooting the server from the console or 0 to leave it as default."
read CTRLID

echo "Please enter 1 to ignore all ICMP requests or leave it as 0 as default."
read ECHOID

echo "Please enter 1 to accept redirects via ICMP or 0 to prevent ICMP redirects."
read ECHORID

#Configure the parameter permanently.
echo "# sysctl settings are defined through files in" > /etc/sysctl.conf
echo "# /usr/lib/sysctl.d/, /run/sysctl.d/, and /etc/sysctl.d/." >> /etc/sysctl.conf
echo "#" >> /etc/sysctl.conf
echo "# Vendors settings live in /usr/lib/sysctl.d/." >> /etc/sysctl.conf
echo "# To override a whole file, create a new file with the same in" >> /etc/sysctl.conf
echo "# /etc/sysctl.d/ and put new settings there. To override" >> /etc/sysctl.conf
echo "# only specific settings, add a file with a lexically later" >> /etc/sysctl.conf
echo "# name in /etc/sysctl.d/ and put new settings there." >> /etc/sysctl.conf
echo "#" >> /etc/sysctl.conf
echo "# For more information, see sysctl.conf(5) and sysctl.d(5)." >> /etc/sysctl.conf

sysctl -w net.ipv4.conf.default.rp_filter=$((RPID)) >> /etc/sysctl.conf
sysctl -w net.ipv4.tcp_syncookies=$((COID)) >> /etc/sysctl.conf
sysctl -w net.ipv4.ip_forward=$((FORID)) >> /etc/sysctl.conf
sysctl -w kernel.ctrl-alt-del=$((CTRLID)) >> /etc/sysctl.conf
sysctl -w net.ipv4.icmp_echo_ignore_all=$((ECHOID)) >> /etc/sysctl.conf
sysctl -w net.ipv4.conf.all.accept_redirects=$((ECHORID)) >> /etc/sysctl.conf


#Make the changes live.
sysctl -p

#Remember, this script does not require the machine to restart. It takes affects immediately to the Linux kernel.
