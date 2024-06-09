##Lab-3 Description  

 Objective: Create a shell script that automates checking disk space usage and sends an email alert if usage exceeds a specified threshold.

## steps 
 1. **install ssmtp packages for mail services**
 2. **set the ssmtp configuration**
 3. **check_disk_space.sh**
 4. **Give execute permission to your script**
 5. **run the script**

## Solution Steps

### Step1: install ssmtp packages for mail services
```
sudo apt install ssmtp
```

### Step2: set the ssmtp configuration
```
sudo vim /etc/ssmtp/ssmtp.conf
```
![](https://github.com/omarshaban32/ivolvo/blob/main/day-1/lab-2/ssmtp.png)

enter your credential

notice :

AuthUser= < enter your mail >

AuthPass= < enter the App Password you make using Google account managment for example >

### Step3: create check_disk_space.sh
```
#!/bin/bash

# Set the threshold percentage
THRESHOLD=        # your threshold

# Email configuration
EMAIL_TO="your-email@gmail.com"
EMAIL_SUBJECT="Disk Space Alert"

# Get disk usage information
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if disk usage exceeds the threshold
if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    # Compose email message
    EMAIL_MESSAGE="Disk space usage on server exceeds ${THRESHOLD}%. Current usage: ${DISK_USAGE}%"

    # Send email alert using ssmtp
    echo -e "Subject: $EMAIL_SUBJECT\n\n$EMAIL_MESSAGE" | ssmtp $EMAIL_TO
fi
```

### Step4: Give execute permission to your script
```
chmod +x /path/to/yourscript.sh
```

### Step5: run the script

![](https://github.com/omarshaban32/ivolvo/blob/main/day-1/lab-2/mail.png)
