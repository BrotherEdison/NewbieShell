#!/bin/bash
# net.newbieshell.bootstrap.preLaunch
# This source file is part of the NewbieShell Project.

# Version Identification

MAJORVER=0
MINORVER=0
PATCHVER=4
SUBLEVEL=-dev

# Variables

DATETIME=$(date +%X\ %x)
DATE=$(date +%X)
TIME=$(date +%x)

# No functions for this module
# Runtime

cat <<< _EOF_ 
[$TIME INFO] Bootstrap (vNaN)
[$TIME INFO] Current time is $DATETIME
[$TIME INFO] os.name: $(uname)
[$TIME INFO] os.version: $(uname -r)
[$TIME INFO] os.arch: $(uname -p)
[$TIME INFO] system.arch: $(uname -m)
_EOF_
sleep 5
echo "Bootstrap complete, advancing into stage 1.5 (bootstrap-client)."
source net/newbieshell/bootstrap/Login.sh	

