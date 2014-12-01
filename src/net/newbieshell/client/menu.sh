#!/bin/bash
# net.newbieshell.client.menu
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=1
PATCHVER=8
SUBLEVEL=

# Variables

DATETIME=$(date +%X\ %x)
DATE=$(date +%x)
TIME=$(date +%X)
HOUR=$(date +%H)
PATH=$(pwd)

# Functions

menu() {
	clear
	unset REPLY
	echo $greeting", "$userName", and good "$greetHour"."
	echo "It is currently "$DATETIME"."
	echo "Please select a choice:"
	echo "[S]ingleuser"
	echo "[M]ultiuser"
	echo "S[e]ttings"
	echo "[Q]uit"
	read -N 1
	if [ -z $REPLY ]; then
		menu
	elif [ $REPLY = S ]; then
		su_menu
	elif [ $REPLY = M ]; then
		mu_menu
	elif [ $REPLY = E ]; then
		settings
	elif [ $REPLY = Q ]; then
		exit 0
	else
		menu
	fi
}

su_menu() {
	echo "Parent: Starting integrated host..."
	echo "Parent: Integrated host started on 127.0.0.1:30676..."
	echo "Parent: Spawning connection process..."
	mu_hostname=127.0.0.1
	source net/newbieshell/server/connect/ssh.sh
	exit
}
mu_menu() {
		echo "NewbieShell Multiuser is currently very buggy. Report any known bugs to <https://github.com/BrotherEdison/NewbieShell/issues> so we can squash them."
	echo "Enter the IP, hostname, or web address of the Multiuser host."
	read mu_hostname
	echo "Enter the username for connecting to the Multiuser host. (Leave blank to assume current username)"
	read mu_username
	if [ -z $mu_hostname ]; then
		echo "Error: you have entered a blank hostname."
		connect
	fi
	if [ -z $mu_username ]; then
		mu_username=$userName

	fi
	echo "Connecting to the host..."
	ping -c 3 $mu_hostname
	if [ $? = 2 ]; then
		echo "Failed to connect to the host"
		echo "Unknown host"
	else
		echo "Parent: Spawning connection process..."
		source net/newbieshell/server/connect/ssh.sh
		exit
	fi
}
settings() {
	# Still a work in progress
	menu
}
# Runtime

menu
