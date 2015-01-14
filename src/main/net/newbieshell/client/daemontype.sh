#!/usr/bin/env bash
# net.newbieshell.client.daemontype
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=2
PATCHVER=2
SUBLEVEL=

# No variables for this module
# No functions for this module

# Runtime
if [ -f /usr/bin/systemctl ]; then
	INITTYPE=systemd
elif [ -f /usr/sbin/update-rc.d ]; then
    INITTYPE=sysv-deb
elif [ -f /usr/sbin/chkconfig ]; then
    INITTYPE=sysv-rh
else
    INITTYPE=unknown
fi
source net/newbieshell/client/menu.sh
