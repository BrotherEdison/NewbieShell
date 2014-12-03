#!/bin/bash
# net.newbieshell.admin.shell
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=1
PATCHVER=11
SUBLEVEL=

# Variables

hashedPassWord=$(echo $passWord | sha512sum | cut -f 1)
passwdFile='/etc/nsh/login/passwd'

# Functions
infoBox1() {
  echo "You are about to enter an administration session. The shell available to you will be adsh, an adminstration shell written for NewbieShell. The text editor available to you is nano. To get a list of utilities that are available, type help. To end this session and return to the menu, type exit."
  echo "Press a key to continue."
  read -N 1
  unset REPLY
  adsh
}
adsh() {
  cd /etc/nsh
  if [ $PWD = /etc/nsh ]; then
    adshPWD=~
  elif echo $PWD | cut -c 9 | grep /; then
    adshPWD=~/$(echo $PWD | cut -c 9-) 
  else
    adshPWD=$PWD
  fi
  unset command
  read -p "$adshPWD #" command
  if [ $command = help ]; then
    echo "Utilities available:"
    echo "1. usermgr"
    echo "2. filemgr"
    echo "Type help <util-number> for more specific help."
    adsh
  elif [ $command = usermgr ]; then
    usermgr
  elif [ $command = filemgr ]; then
    filemgr
  else
    echo "adsh: $command: command not found"
    return 1
    adsh
  fi
}
usermgr() {
  clear
  unset REPLY
  echo "User Manager"
  echo "List of commands:"
  echo "[C]reate a new user"
  echo "[D]elete an existing user"
  echo "[M]odify an existing user"
  echo "[L]ookup user(s)"
  echo "[E]xit"
  read -N 1
  if [ $REPLY = C ]; then
    usermgr_create
  elif [ $REPLY = D ]; then
    usermgr_delete
  elif [ $REPLY = M ]; then
    usermgr_modify
  elif [ $REPLY = L ]; then
    usermgr_lookup
  elif [ $REPLY = E ]; then
    adsh
  else
    return 1
    usermgr
  fi
}
usermgr_create() {
  echo "Creating a new user."
  read -p "Username:" usermgr_create_username
  read -p "Full Name:" usermgr_create_fullname
  read -sp "Password:" usermgr_create_password
  echo "I will create a new user with the username $usermgr_create_username, the full name $usermgr_create_fullname, with a password of $usermgr_create_password."
  echo "Is the afromentioned information correct?"
  read -N 1 yn
  if [ $yn = y ]; then
    passWord=$usermgr_create_password
    usermgr_create_fullstring="$usermgr_create_username:$usermgr_create_fullname:$hashedPassWord"
    echo $usermgr_create_fullstring >> $passwdFile
    usermgr
  elif [ $yn = n ]; then
    unset usermgr_create_fullname
    unset usermgr_create_password
    unset usermgr_create_username
    usermgr_create
  else
    unset usermgr_create_fullname
    unset usermgr_create_password
    unset usermgr_create_username
    usermgr_create
  fi