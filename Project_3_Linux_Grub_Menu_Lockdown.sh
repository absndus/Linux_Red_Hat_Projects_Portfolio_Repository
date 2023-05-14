#!/bin/bash
#File: LinuxAdminLockDownGrub.sh
#Date: 05/14/2023
#Author: Albert B. Schultz
#Version: 1.00
#Descriptions: This script asks the administrator for a new password and write the md5 password hash to a new tab line in the grub.lst file automatically along with a minute warning before the reboot. 

echo "Please enter a new password for the MD5 Grub to securely lock down your Grub menu to prevent others from accessing the machine, physically:"
#grub-md5-crypt

echo "Copy and paste the md5 hash, including the period, provided after you have created the password for the Grub menu:"
read MD5PASS 

#Once completed, pass the md5 variable, MD5PASS to the /boot/grub/menu.lst by appending and indenting the information. 
echo "	password --md5 $MD5PASS" >> /boot/grub/menu.lst
echo "	lock" >> /boot/grub/menu.lst

#Reboot in 10 seconds with a warning banner.
echo "This machine will be restarted in 10 seconds."
sleep 10 
reboot -f

#End of program