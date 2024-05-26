#!/bin/bash

# Loop through the range 0-255 for the last octet of the IP address
for i in {0..255}
do
  # Ping the current IP address with a timeout of 1 second
  if ping -c 1 -W 1 192.168.226.$i &> /dev/null
  then
    echo "Server 192.168.226.$i is up and running"
  else
    echo "Server 192.168.226.$i is unreachable"
  fi
done

