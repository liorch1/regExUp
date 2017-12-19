#!/bin/bash

#name: lior cohen
#date: 18/12/2017
#homework: 3.create a script that checks who was the last user that created file /tmp and validate that user with /etc/passwd.(regex and /etc/passwd)


lastuser=$(ls -ltr /tmp | tail -1 | awk -F " " '{print $3}') #filter by time and user
echo "$lastuser created the last file on /tmp"
echo "more details about him: "
grep ^$lastuser /etc/passwd  #use regex to find the user in /etc/passwd
