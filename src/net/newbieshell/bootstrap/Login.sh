#!/bin/bash
# net.newbieshell.bootstrap.Login
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=1
PATCHVER=1
SUBLEVEL=

# Variables

hashedPassWord=$(echo $passWord | sha512sum)
passwdFile='/etc/nsh/login/passwd'

# Functions

loginMenu() {
	clear
	unset $REPLY
	echo "Welcome to NewbieShell version 0.1.1."
	echo "Please enter your username:"
	read userName
	if cat $passwdFile | cut -f 1 | grep $userName; then
		echo "Welcome, "$userName"."
		echo "Please enter your password."
		read -s passWord
		if cat $passwdFile | cut -f 2 | grep $hashedPassWord; then
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
