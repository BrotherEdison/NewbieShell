#!/bin/bash
# net.newbieshell.bootstrap.preLaunch
# This source file is part of the NewbieShell Project.

# Version Identification

MAJORVER=0
MINORVER=0
PATCHVER=3
SUBLEVEL=-dev

# Variables

DATETIME=$(date +%X\ %x)
DATE=$(date +%X)
TIME=$(date +%x)

# No functions for this module
# Runtime

cat <<< _EOF_ 
[$TIME INFO] Bootstrap (v$MAJORVER.$MINORVER.$PATCHVER$SUBLEVEL)
[$TIME INFO] Current time is $DATETIME
[$TIME INFO] os.name: $(uname)
[$TIME INFO] os.version: $(uname -r)
[$TIME INFO] os.arch: $(uname -p)
[$TIME INFO] system.arch: $(uname -m)
_EOF_
sleep 5
source net/newbieshell/bootstrap/Login.sh	

