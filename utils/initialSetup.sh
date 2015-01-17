#!/usr/bin/env bash
# NewbieShell Initial Setup
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=2
PATCHVER=1
SUBLEVEL=

# Variables

hashedPassWord=$(echo $passWord | sha512sum)
adminIdent=/etc/NewbieShell/admin.id

# Functions
checkroot() {
  if [ ! $EUID = 0 ]; then
    echo "You must run this program as root"
    exit 1
  elif [ $EUID = 0 ]; then
    menu
  else
    echo "Variable \$EUID not configured."
    exit 1
  fi
}

menu() {
  echo "Thank you for choosing NewbieShell."
  echo "Before you can begin using NewbieShell, there are some settings that must be configured."
  step1
}
step1() {
  echo "Creating filesystem hiearchy..."
  mkdir /etc/NewbieShell
  touch /etc/NewbieShell/admin.id
  touch /etc/NewbieShell/passwd
  chmod 700 /etc/NewbieShell
  chmod 600 /etc/NewbieShell/*
  chown -R 1000:1000 /etc/NewbieShell
}

# Runtime
