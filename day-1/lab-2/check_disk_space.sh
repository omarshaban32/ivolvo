#!/bin/bash

# Email settings
EMAIL="omar.shaban1989@gmail.com.com"
SUBJECT="Disk Space Alert on $(hostname)"
THRESHOLD=1  # Threshold percentage for disk usage

# Function to send email
send_email() {
    local message=$1
    echo -e "Subject: $SUBJECT\n\n$message" | ssmtp "$EMAIL"
}

# Check disk usage
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
    # Extract the percentage value and remove the '%' sign
    usage=$(echo $output | awk '{ print $1}' | cut -d'%' -f1)
    partition=$(echo $output | awk '{ print $2 }')

    if [ $usage -ge $THRESHOLD ]; then
        MESSAGE="Warning: Disk usage on $partition has reached $usage% on $(hostname)"
        send_email "$MESSAGE"
    fi
done

