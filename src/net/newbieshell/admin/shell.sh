#!/bin/bash
# net.newbieshell.admin.shell
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=1
PATCHVER=17
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
  adsh_read_command
}
adsh_read_command() {
  unset command
  read -p "$adshPWD # " command
  adsh_parse_command
}
adsh_parse_command() {
  if [ $command = help ]; then
    echo "Utilities available:"
    echo "1. usermgr"
    echo "Type help <util-number> for more specific help."
    adsh
  elif [ $command = usermgr ]; then
    usermgr
  else
    echo "adsh: $command: command not found"
    return 1
    adsh_read_command
  fi
}
usermgr() {
  clear
  unset REPLY
  echo "User Manager"
  echo "List of commands:"
  echo "[C]reate a new user"
  echo "[D]elete an existing user"
  echo "[L]ookup user(s)"
  echo "[E]xit"
  read -N 1
  if [ $REPLY = C ]; then
    usermgr_create
  elif [ $REPLY = D ]; then
    usermgr_delete
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
  read -p "Username: " usermgr_create_username
  read -p "Full Name: " usermgr_create_fullname
  read -sp "Password: " usermgr_create_password
  echo "I will create a new user with the username $usermgr_create_username, the full name $usermgr_create_fullname, with a password of $usermgr_create_password."
  echo "Is the afromentioned information correct?"
  read -N 1 yn
  if [ $yn = y ]; then
    passWord=$usermgr_create_password
    usermgr_create_fullstring="$usermgr_create_username:$usermgr_create_fullname:$hashedPassWord"
    echo $usermgr_create_fullstring >> $passwdFile
    unset usermgr_create_fullname
    unset usermgr_create_password
    unset usermgr_create_username
    unset usermgr_create_fullstring
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
}
usermgr_delete() {
  echo "Removing a user."
  read -p usermgr_delete_username
  grep "$search_terms" < "$passwdFile" > /dev/null
  if [ $? = 1 ]; then
    echo "No users matched query."
    usermgr_delete
  elif [ $(grep "$search_terms" < "$passwdFile" | wc -l) -gt 1 ]; then
    echo "Ambiguous query; please enter an unanbiguous query."
    usermgr_delete
  else
    echo "Deleting user $(grep "$search_terms" < "$passwdFile")."
    echo "All user data will be LOST! Are you sure? [yes/no]"
    read yesno
    if [ "$yesno" = y ] || [ "$yesno" = n ] || [ "$yesno" = Y ] || [ "$yesno" = N ]; then
      echo "Please enter 'yes' or 'no'!"
      usermgr_delete
    elif [ "$yesno" = yes ] || [ "$yesno" = Yes ] || [ "$yesno" = yEs ] || [ "$yesno" = yeS ] || [ "$yesno" = YEs ] || [ "$yesno" = yES ] || [ "$yesno" = YeS ] || [ "$yesno" = YES ]; then
      removed_user_string=$(grep "$search_terms" < "$passwdFile")
      sed -i "s/$removed_user_string/removed_user_$RANDOM/" $passwdFile
    else
      usermgr_delete
    fi
  fi
}
usermgr_lookup() {
  read -p "Search: " search_terms
  grep "$search_terms" < "$passwdFile" > /dev/null
  if [ $? = 1 ]; then
    echo "No users matched query."
    usermgr_lookup
  else
    echo "$(grep "$search_terms" < "$passwdFile" | wc -l) users matched query."
    grep "$search_terms" < "$passwdFile" | less
    usermgr_lookup
  fi
}

# Runtime

infoBox1