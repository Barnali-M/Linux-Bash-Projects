#!/bin/bash
# Generate logs
Logfile="/tmp/Usermanagement.log"
echo " The user creation started at $(date)"

# Create users from a file
while read -r user;do
    if ! getent passwd "$user" >/dev/null;then
        sudo useradd "$user" >>"$Logfile" 2>&1  # Generate logs
    else
        echo "$user already exist" >>"$Logfile"
    fi
    
    if ! getent group testers >/dev/null;then
        # Create groups
        sudo groupadd testers >>"$Logfile"

        # Add users to groups
        sudo usermod -aG testers "$user" 
    else
        echo " Group already exist" >>"$Logfile"
        echo "$(date):$user is added to the group testers">>"$Logfile"
    fi
    #password set
    echo "$user:Welcome123" | sudo chpasswd 
done < user.txt

echo "The script ended at $(date)" >>"$Logfile"




    

