#!/bin/bash

#name: lior cohen
#date: 18/12/2017
#homework: 1.a. create a script that will take a list of users and will add them to your system.
#  b. the script should have a validation function: it will check if user with that username or nickname exists.(use regex)
#  c. if user exists, script will stop and it will give grandiouse output that user or nickname already exists.
#  d. if user does not exists, script will continue and it will give grandiouse output that user or nickname is being created.

echo "please insert user names to create: " 
read -a username #get array

validation() {  #check if the user exists
userlist=$(awk -F ":" '{print $1}' /etc/passwd | grep ^$1$ )
	if [[ -n $userlist ]]; then
		echo -e "user $1 info:\n $(grep ^$1 /etc/passwd)"
		echo "and he have: $(find / -user $1 2> /dev/null | wc -l) files";
		exit 1;
	else
		sudo useradd $1; #if not add the user
		echo -e "user $1 being created more detials: \n$(grep ^$1 /etc/passwd)";
	fi
}

for i in ${username[@]}; do #loop for all the users name in the array
	validation $i
done
