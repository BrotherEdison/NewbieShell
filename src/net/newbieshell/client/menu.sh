#!/bin/bash
# net.newbieshell.client.menu
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=1
PATCHVER=3
SUBLEVEL=

# Variables

DATETIME=$(date +%X\ %x)
DATE=$(date +%x)
TIME=$(date +%X)
HOUR=$(date +%H)
PATH=$(pwd)
programList='/etc/nsh/programs'

# Functions

menu() {
	echo $greeting", "$userName", and good "$greetHour"."
	echo "It is currently "$DATETIME"."
	echo
	sumu
}
sumu() {
	echo "Do you wish to use Singleuser for this session, or connect to a Multiuser host? [S/M]"
	read -n 1
	if [ $REPLY = S ]; then
		prompt
	elif [ $REPLY = M ]; then
		connect
	else
		prompt
	fi
}
connect() {
	echo "NewbieShell Multiuser is currently very buggy. Report any known bugs to <https://github.com/BrotherEdison/NewbieShell/issues> so we can squash them."
	echo "Enter the IP, hostname, or web address of the Multiuser host."
	read mu_hostname
	echo "Enter the username for connecting to the Multiuser host. (Leave blank to assume current username)"
	read mu_username
	if [ -z $mu_username ]; then
		mu_username=$userName
	fi
prompt() {
	read -p "$username is in $pwd>" cmd
	if cat $programList | grep $cmd ]; then
		$cmd
	else
		echo $cmd": command not found..."
	fi
}
# Runtime

menu
