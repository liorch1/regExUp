#!/bin/bash

#name: lior cohen
#date: 18/12/2017
#homework: 2.create a script that will display a list of all the users on your system who log in with the Bash shell as a default. (regex and /etc/skel/)

echo -e "users list that log in with bash shell as default: \n";
grep bash$ /etc/passwd
