#!/bin/bash
# net.newbieshell.admin.shell
# This source file is part of the NewbieShell project.

# Version Identification

MAJORVER=0
MINORVER=1
PATCHVER=10
SUBLEVEL=

# Variables



# Functions
infoBox1() {
  echo "You are about to enter an administration session. The shell available to you will be adsh, an adminstration shell for NewbieShell. The text editor available to you is nano. To end this session and return to the menu, type exit."
  echo "Press a key to continue."
  read -N 1
  unset REPLY
  adsh
}
adsh() {
 ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
 ### adsh, an administration shell for NewbieShell                       ###
 ### copyright (c) 2014 BrotherEdison                                    ###
 ### Licensed under the MIT License                                      ###
 ### This version of adsh is modified according to NewbieShell's needs.  ###
 ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
}