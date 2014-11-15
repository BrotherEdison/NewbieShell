#!/bin/bash
# net.newbieshell.client.menu
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=0
PATCHVER=2
SUBLEVEL=-dev

# Variables

DATETIME=$(date +%X\ %x)
DATE=$(date +%x)
TIME=$(date +%X)
HOUR=$(date +%H)
PATH=$(pwd)

# Functions

menu() {
	echo $greeting", "$userName", and good "$greetHour"."
	echo "It is currently "$DATETIME"."
	echo
	prompt
}
prompt() {
	read -p $TIME\ $userName": "$PATH"> "
	# Still a work in progress
}
# Runtime

menu
