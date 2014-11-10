#!/bin/bash
# net.newbieshell.client.menu
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=0
PATCHVER=1
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
	else
		greeting='Hello, '
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
[$TIME WARN] Caused by: function checkGreetTime() (at net.newbieshell.client.menu:29)
[$TIME WARN] This can be safely ignored, but 24-hour time will not function.
_EOF_
	else
		return 0
	fi
}
# Still a work in progress

# Runtime
