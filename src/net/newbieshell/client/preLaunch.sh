#!/bin/bash
# net.newbieshell.client.preLaunch
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=0
PATCHVER=6
SUBLEVEL=-dev

# Variables

initialLogin=0
DATETIME=$(date +%X\ %x)
DATE=$(date +%x)
TIME=$(date +%X)
HOUR=$(date +%H)

# Functions

checkIfInitialLogin() {
	if [ $initialLogin = 0 ]; then
		greeting='Welcome back, '
	elif [ $initialLogin = 1 ]; then
		greeting='Welcome to NewbieShell, '
	else
		ERR1=2779096485
	fi
}
checkGreetTime() {
	if [ $HOUR -gt 6 ]; then
		greetHour=Morning
	elif [ $HOUR -gt 13 ]; then
		greetHour=Afternoon
	elif [ $HOUR -gt 18 ]; then
		greetHour=Night
	else
		ERR2=464367618
	fi
}
catchGreetTimeException() {
	if [ $ERR2 = 464367618 ]; then
		catchInitialLoginException
		source net/newbieshell/client/menu.sh
	else
		return 0
	fi
}
catchInitialLoginException() {
	if [ $ERR1 = 2779096485 ]; then
		source net/newbieshell/client/menu.sh
	else
		return 0
	fi
}

# Runtime

checkIfInitialLogin
checkGreetTime
catchGreetTimeException
catchInitialLoginException
source net/newbieshell/client/menu.sh
