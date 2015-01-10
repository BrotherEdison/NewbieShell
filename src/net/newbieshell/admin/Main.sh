#!/usr/bin/env bash
# net.newbieshell.admin.Main
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=2
PATCHVER=1
SUBLEVEL=

# Variables

hashedPassWord=$(echo $passWord | sha512sum)
adminIdent=/etc/nsh/ident/admin.id

# Functions

adminLogin() {
  echo "NewbieShell Control Panel, version "$MAJORVER"."$MINORVER"."$PATCHVER
  echo "Please enter the administrator password to continue."
  read -s passWord
  if cat $adminIdent | grep $hashedPassWord; then
    echo "Authentication successful. Redirecting to control panel..."
    source net/newbieshell/admin/menu.sh
  else
    echo "Authentication failed!"
    adminLogin
  fi
}

# Runtime

adminLogin