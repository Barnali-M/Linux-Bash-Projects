#!/bin/bash
# Check disk usage.

# If usage exceeds 80%:

# WARNING: Disk usage is 85%

usage=$(df -h | awk 'NR==2 { gsub("%"," "$5); print $5'})

if [[ "$usage" -gt 80 ]];then
    echo "Warning: Disk usage is ${user}%"
else   
    echo "Disk usage is normal ${user}%"
fi



