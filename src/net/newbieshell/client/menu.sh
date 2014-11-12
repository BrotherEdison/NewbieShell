#!/bin/bash
# net.newbieshell.client.menu
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=0
PATCHVER=2
SUBLEVEL=-dev

# Variables

initialLogin=0
DATETIME=$(date +%X\ %x)
DATE=$(date +%X)
TIME=$(date +%x)
HOUR=$(date +%H)

# Functions

checkIfInitialLogin() {
	if [ $initialLogin = 0 ]; then
		greeting='Welcome back, '
	elif [ $initialLogin = 1 ]; then
		greeting='Welcome to NewbieShell, '
	else
		return 2779096485
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
		return 464367618
	fi
}
catchGreetTimeException() {
	if [ $? = 464367618 ]; then
		cat <<- _EOF_
[$TIME WARN] Caught exception: Could not initialize variable greetHour.
[$TIME WARN] Caused by: function checkGreetTime() (at net.newbieshell.client.menu:31)
[$TIME WARN] This can be safely ignored, but 24-hour time will not function.
_EOF_
	else
		return 0
	fi
}
catchInitialLoginException() {
	if [ $? = 2779096485 ]; then
		cat <<- _EOF_
[$TIME WARN] Caught exception: Could not initialize variable greeting.
[$TIME WARN] Caused by: function checkIfInitialLogin() (at net.newbieshell.client.menu:22)
[$TIME WARN] This can be safely ignored, but I will use the default greeting.
_EOF_
	else
		return 0
	fi
}
# Still a work in progress

# Runtime
