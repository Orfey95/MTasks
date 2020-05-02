#!/bin/bash

set -e

# Variables
mail_server=$1
recipient=$2
text_mail=$3

# Send mail
( echo open $mail_server 25
sleep 5
echo mail from: root@gmail.com
sleep 2
echo rcpt to: $recipient
sleep 2
echo data
sleep 2
echo subject: notification
echo $text_mail
sleep 5
echo .
sleep 5
echo quit ) | telnet
