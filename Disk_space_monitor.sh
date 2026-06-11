#!/bin/bash
# Check disk usage.
usage=$(df -h | awk 'NR==2 { gsub("%"," "$5); print $5'})

# If usage exceeds 80%:
if [[ "$usage" -gt 80 ]];then

    # WARNING: Disk usage is 85%
    echo "Warning: Disk usage is ${user}%"
    
else   
    echo "Disk usage is normal ${user}%"
fi


