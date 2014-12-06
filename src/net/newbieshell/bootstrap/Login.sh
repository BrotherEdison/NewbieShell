#!/bin/bash
# net.newbieshell.bootstrap.Login
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=2
PATCHVER=0
SUBLEVEL=

# Variables

hashedPassWord=$(echo $passWord | sha512sum)
passwdFile='/etc/nsh/login/passwd'

# Functions

loginMenu() {
	clear
	unset $REPLY
	echo "Welcome to NewbieShell version "$MAJORVER"."$MINORVER"."$PATCHVER"."
	echo "Please enter your username:"
	read userName
	if cat $passwdFile | cut -d : -f 1 | grep $userName; then
		echo "Welcome, "$userName"."
		echo "Please enter your password."
		read -s passWord
		if cat $passwdFile | cut -d : -f 3 | grep $hashedPassWord; then
			echo "Logged in as "$userName"."
			source net/newbieshell/client/Main.sh
		else
			echo "Password is not correct!"
			loginMenu
		fi
	else
		echo "Username does not exist!"
	fi
}

# Runtime

loginMenu
