#!/bin/bash
# Project 1: User Management System
# Requirements:
# Create users from a file
# Create groups
# Add users to groups
# Set passwords
# Generate logs

Logfile="/tmp/Usermanagement.log"
echo " The user creation started at $(date)"
while read -r user;do
    if ! getent passwd "$user" >/dev/null;then
        sudo useradd "$user" >>"$Logfile" 2>&1
    else
        echo "$user already exist" >>"$Logfile"
    fi
    
    if ! getent group testers >/dev/null;then
        sudo groupadd testers >>"$Logfile"
        sudo usermod -aG testers "$user" 
    else
        echo " Group already exist" >>"$Logfile"
        echo "$(date):$user is added to the group testers">>"$Logfile"
    fi
    #password set
    echo "$user:Welcome123" | sudo chpasswd 
done < user.txt

echo "The script ended at $(date)" >>"$Logfile"




    

