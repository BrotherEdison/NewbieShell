#!/bin/bash
# net.newbieshell.client.daemontype
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=2
PATCHVER=0
SUBLEVEL=

# No variables for this module
# No functions for this module

# Runtime
if [ -f /usr/bin/systemctl ]; then
	INITTYPE=systemd
else
	INITTYPE=unsupported
fi
source net/newbieshell/client/menu.sh
