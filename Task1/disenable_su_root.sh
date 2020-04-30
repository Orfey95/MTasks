#!/bin/bash


set -e

# Variables
username=$1

echo "Cmnd_Alias      SUROOT=/bin/su "",\
/bin/su -,\
/bin/su - root,\
/bin/su root,\
/usr/bin/su "",\
/usr/bin/su -,\
/usr/bin/su - root,\
/usr/bin/su root,\ 
/bin/bash "",\
/usr/bin/sudo -s,\
/usr/bin/sudo su "",\
/usr/bin/sudo su -,\
/usr/bin/sudo su - root,\
/usr/bin/sudo sudo *
$username ALL = (ALL) ALL, !SUROOT" > /etc/sudoers.d/$username
