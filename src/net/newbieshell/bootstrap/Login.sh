#!/bin/bash
# net.newbieshell.bootstrap.Login
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=0
PATCHVER=1
SUBLEVEL=-dev

# Variables

configFile='/etc/default/nsh/Login.conf'
passwdFile='/etc/default/nsh/passwd'
hashedPass=$(echo $password | sha512sum)

# Functions

getCreds() {
	clear
	unset $REPLY
	echo "Welcome to NewbieShell version NaN."
	echo "List of users:"
	cat $passwdFile | cut -f 1,2 | head
	echo "Enter the number between the brackets, or type N if it is not listed."
	read -N 1
	if [ $REPLY = N ]; then
		echo "Not listed? Please enter your username below."
		read -p "Username: " username
		if cat $passwdFile | grep $username ; then
			echo read -s -p "Password: " password
			if cat $passwdFile | grep $hashedPass; then
				echo "Logging in..."
				source net/newbieshell/client/Main.sh
			else
				echo "Password incorrect!"
				getCreds
			fi
		else
			echo "Username incorrect!"
		fi
	else
		return 16435934 # Still a work in progress
	fi
}

# Runtime

getCreds

