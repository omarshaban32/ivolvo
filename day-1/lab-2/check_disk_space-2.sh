#!/bin/bash

# Set the threshold (in percentage)
THRESHOLD=1

# Email settings
EMAIL="omar.shaban1989@gmail.com"
SUBJECT="Disk Space Alert on $(hostname)"
FROM="omar.elsheemy32@gmail.com"
MESSAGE_FILE="/tmp/disk_space_alert.txt"

# Check disk space usage
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output; do
  # Extract usage percentage and filesystem
  usage=$(echo $output | awk '{ print $1 }' | sed 's/%//g')
  filesystem=$(echo $output | awk '{ print $2 }')

  # Check if usage exceeds threshold
  if [ $usage -ge $THRESHOLD ]; then
    echo "Warning: Disk space on $filesystem is critically low. Used: $usage%" > $MESSAGE_FILE
    echo "To: $EMAIL" >> $MESSAGE_FILE
    echo "Subject: $SUBJECT" >> $MESSAGE_FILE
    echo "From: $FROM" >> $MESSAGE_FILE
    echo "" >> $MESSAGE_FILE
    echo "Warning: Disk space on $filesystem is critically low. Used: $usage%" >> $MESSAGE_FILE

    # Send email
    sendmail -t < $MESSAGE_FILE
  fi
done

