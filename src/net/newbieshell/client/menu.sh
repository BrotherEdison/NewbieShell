#!/bin/bash
# net.newbieshell.client.menu
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=1
PATCHVER=1
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
	prompt
}
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
