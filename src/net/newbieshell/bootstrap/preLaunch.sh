#!/bin/bash
# net.newbieshell.bootstrap.preLaunch
# This source file is part of the NewbieShell Project.

# Version Identification

MAJORVER=0
MINORVER=0
PATCHVER=1
SUBLEVEL=-dev

# Variables

DATETIME=$(date +%X\ %x)
DATE=$(date +%X)
TIME=$(date +%x)

# No functions for this module
# Runtime

echo "["$TIME" INFO] Bootstrap (v"$MAJORVER.$MINORVER.$PATCHVER$SUBLEVEL")"
echo "["$TIME" INFO] Current time is "$DATETIME
echo "["$TIME" INFO] os.name: "$(uname)
echo "["$TIME" INFO] os.version: "$(uname -r)
echo "["$TIME" INFO] os.arch: "$(uname -p)
echo "["$TIME" INFO] system.arch: "$(uname -m)
sleep 5
source net/newbieshell/bootstrap/menu.sh	

