#!/bin/bash
# net.newbieshell.admin.menu
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=1
PATCHVER=11
SUBLEVEL=

# No variables for this module
# Functions

greetMenu() {
  clear
  unset REPLY
  echo "Would you like to use the interactive interface, or drop to an administrative shell? [I/S]"
  read -N 1
  if [ $REPLY = I ]; then
    source net/newbieshell/admin/interactive.sh
  elif [ $REPLY = S ]; then
    source net/newbieshell/admin/shell/shell.sh
  else
    greetMenu
  fi
}

# Runtime

greetMenu