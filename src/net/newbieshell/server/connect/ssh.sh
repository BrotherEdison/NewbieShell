#!/bin/bash
# net.newbieshell.client.menu
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=2
PATCHVER=0
SUBLEVEL=

# Variables

defaultConnectionPort=30676
trunc_hostname=$(echo $mu_hostname | cut -d : -f 1)

# Functions
findConnectionPort() {
	if [ -z $(echo $mu_hostname | cut -d : -f 2) ]; then
		trunc_connectionPort=$defaultConnectionPort
	else
		trunc_connectionPort=$(echo $mu_hostname | cut -d : -f 2)
	fi
}
remote_connect() {
	echo "Child: Opening remote connection for "$mu_username" to "$trunc_hostname":"$trunc_connectionPort"..."
	ssh -p $trunc_connectionPort $mu_username@$trunc_username
	echo "Child: Remote connection closed. Exiting."
	exit
}

# Runtime

findConnectionPort
remote_connect
