##Lab-3 Description  

 Create a shell script that would ping every single server in the 192.168.1.x subnet where X IS a number between 0 and 255. If a ping succeeds, statement "Server 192.168.1.x is up and running" will be displayed. Otherwise, if a ping fails, statement "Server 192.168.1.x is unreachable" will be displayed.

## steps 
 1. **create ping.sh**
 2. **Give execute permission to your script**

## Solution Steps

### Step1: create ping.sh
```
#!/bin/bash
# ping to my network 192.168.1.[0:255]
# Loop through the range 0-255 for the last octet of the IP address
for i in {0..255}
do
  # Ping the current IP address with a timeout of 1 second
  if ping -c 1 -W 1 192.168.1.$i &> /dev/null
  then
    echo "Server 192.168.1.$i is up and running"
  else
    echo "Server 192.168.1.$i is unreachable"
  fi
done

```

### Step2: Give execute permission to your script
```
chmod +x /path/to/yourscript.sh
```

## run the script

![](https://github.com/omarshaban32/ivolvo/blob/main/day-1/lab-3/ping.png)
