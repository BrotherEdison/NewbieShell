#!/bin/bash
# net.newbieshell.bootstrap.preLaunch
# This source file is part of the NewbieShell Project.

# Version Identification

MAJORVER=0
MINORVER=2
PATCHVER=2
SUBLEVEL=

# No variables for this module
# Functions

SIGHUP() {
  echo "Caught HangUp (SIGHUP)"
  echo "Cleaning up..."
  if [ $INITTYPE = systemd ]; then
    if systemctl status sshd; then
      echo "sshd is running. Terminating..."
      systemctl stop sshd
    else
      echo "sshd was not running."
    fi
  elif [ $INITTYPE = sysv-deb ]; then
    if service ssh status; then
      echo "ssh is running. Terminating..."
      service ssh stop
    else
      echo "ssh was not running."
    fi
  elif [ $INITTYPE = sysv-rh ]; then
    if service sshd status; then
      echo "sshd is running. Terminating..."
      service sshd stop
    else
      echo "sshd was not running."
    fi
  fi
  echo "Terminating."
  exit 0
}

SIGINT() {
  echo "Caught Interrupt (SIGINT)"
  echo "Cleaning up..."
  if [ $INITTYPE = systemd ]; then
    if systemctl status sshd; then
      echo "sshd is running. Terminating..."
      systemctl stop sshd
    else
      echo "sshd was not running."
    fi
  elif [ $INITTYPE = sysv-deb ]; then
    if service ssh status; then
      echo "ssh is running. Terminating..."
      service ssh stop
    else
      echo "ssh was not running."
    fi
  elif [ $INITTYPE = sysv-rh ]; then
    if service sshd status; then
      echo "sshd is running. Terminating..."
      service sshd stop
    else
      echo "sshd was not running."
    fi
  fi
  echo "Terminating."
  exit 0
}
SIGQUIT() {
  echo "Caught Quit (SIGQUIT)"
  echo "Cleaning up..."
  if [ $INITTYPE = systemd ]; then
    if systemctl status sshd; then
      echo "sshd is running. Terminating..."
      systemctl stop sshd
    else
      echo "sshd was not running."
    fi
  elif [ $INITTYPE = sysv-deb ]; then
    if service ssh status; then
      echo "ssh is running. Terminating..."
      service ssh stop
    else
      echo "ssh was not running."
    fi
  elif [ $INITTYPE = sysv-rh ]; then
    if service sshd status; then
      echo "sshd is running. Terminating..."
      service sshd stop
    else
      echo "sshd was not running."
    fi
  fi
  echo "Terminating."
  exit 0
}
SIGILL() {
  echo "Caught IllegalAction (SIGILL)"
  echo "Cleaning up..."
  if [ $INITTYPE = systemd ]; then
    if systemctl status sshd; then
      echo "sshd is running. Terminating..."
      systemctl stop sshd
    else
      echo "sshd was not running."
    fi
  elif [ $INITTYPE = sysv-deb ]; then
    if service ssh status; then
      echo "ssh is running. Terminating..."
      service ssh stop
    else
      echo "ssh was not running."
    fi
  elif [ $INITTYPE = sysv-rh ]; then
    if service sshd status; then
      echo "sshd is running. Terminating..."
      service sshd stop
    else
      echo "sshd was not running."
    fi
  fi
  echo "Terminating."
  exit 0
}
SIGABRT() {
  echo "Caught Abort (SIGABRT)"
  echo "Cleaning up..."
  if [ $INITTYPE = systemd ]; then
    if systemctl status sshd; then
      echo "sshd is running. Terminating..."
      systemctl stop sshd
    else
      echo "sshd was not running."
    fi
  elif [ $INITTYPE = sysv-deb ]; then
    if service ssh status; then
      echo "ssh is running. Terminating..."
      service ssh stop
    else
      echo "ssh was not running."
    fi
  elif [ $INITTYPE = sysv-rh ]; then
    if service sshd status; then
      echo "sshd is running. Terminating..."
      service sshd stop
    else
      echo "sshd was not running."
    fi
  fi
  echo "Terminating."
  exit 0
}
SIGBUS() {
  echo "Caught BusErr (SIGBUS)"
  echo "Cleaning up..."
  if [ $INITTYPE = systemd ]; then
    if systemctl status sshd; then
      echo "sshd is running. Terminating..."
      systemctl stop sshd
    else
      echo "sshd was not running."
    fi
  elif [ $INITTYPE = sysv-deb ]; then
    if service ssh status; then
      echo "ssh is running. Terminating..."
      service ssh stop
    else
      echo "ssh was not running."
    fi
  elif [ $INITTYPE = sysv-rh ]; then
    if service sshd status; then
      echo "sshd is running. Terminating..."
      service sshd stop
    else
      echo "sshd was not running."
    fi
  fi
  echo "Terminating."
  exit 0
}
SIGFPE() {
  echo "Caught DivByZero (SIGFPE)"
  echo "Cleaning up..."
  if [ $INITTYPE = systemd ]; then
    if systemctl status sshd; then
      echo "sshd is running. Terminating..."
      systemctl stop sshd
    else
      echo "sshd was not running."
    fi
  elif [ $INITTYPE = sysv-deb ]; then
    if service ssh status; then
      echo "ssh is running. Terminating..."
      service ssh stop
    else
      echo "ssh was not running."
    fi
  elif [ $INITTYPE = sysv-rh ]; then
    if service sshd status; then
      echo "sshd is running. Terminating..."
      service sshd stop
    else
      echo "sshd was not running."
    fi
  fi
  echo "Terminating."
  exit 0
}
SIGSEGV() {
  echo "Caught SegViolation (SIGSEGV)"
  echo "Cleaning up..."
  if [ $INITTYPE = systemd ]; then
    if systemctl status sshd; then
      echo "sshd is running. Terminating..."
      systemctl stop sshd
    else
      echo "sshd was not running."
    fi
  elif [ $INITTYPE = sysv-deb ]; then
    if service ssh status; then
      echo "ssh is running. Terminating..."
      service ssh stop
    else
      echo "ssh was not running."
    fi
  elif [ $INITTYPE = sysv-rh ]; then
    if service sshd status; then
      echo "sshd is running. Terminating..."
      service sshd stop
    else
      echo "sshd was not running."
    fi
  fi
  echo "Terminating."
  exit 0
}
SIGPIPE() {
  echo "Caught BlockedPipe (SIGPIPE)"
  echo "Cleaning up..."
  if [ $INITTYPE = systemd ]; then
    if systemctl status sshd; then
      echo "sshd is running. Terminating..."
      systemctl stop sshd
    else
      echo "sshd was not running."
    fi
  elif [ $INITTYPE = sysv-deb ]; then
    if service ssh status; then
      echo "ssh is running. Terminating..."
      service ssh stop
    else
      echo "ssh was not running."
    fi
  elif [ $INITTYPE = sysv-rh ]; then
    if service sshd status; then
      echo "sshd is running. Terminating..."
      service sshd stop
    else
      echo "sshd was not running."
    fi
  fi
  echo "Terminating."
  exit 0
}
SIGALRM() {
  echo "Caught Alarm (SIGALRM), ignoring"
}

SIGTERM() {
  echo "Caught Terminate (SIGTERM)"
  echo "Cleaning up..."
  if [ $INITTYPE = systemd ]; then
    if systemctl status sshd; then
      echo "sshd is running. Terminating..."
      systemctl stop sshd
    else
      echo "sshd was not running."
    fi
  elif [ $INITTYPE = sysv-deb ]; then
    if service ssh status; then
      echo "ssh is running. Terminating..."
      service ssh stop
    else
      echo "ssh was not running."
    fi
  elif [ $INITTYPE = sysv-rh ]; then
    if service sshd status; then
      echo "sshd is running. Terminating..."
      service sshd stop
    else
      echo "sshd was not running."
    fi
  fi
  echo "Terminating."
  exit 0
}
SIGTSTP() {
  echo "Caught TerminalStop (SIGTSTP)"
  echo "Not implemented yet, ignoring"
}

# Runtime

source net/newbieshell/bootstrap/Login.sh

