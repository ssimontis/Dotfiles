#!/usr/bin/env bash
# Utility functions for use in other scripts.

declare -r ROOT_UID=0
declare -r E_NO_ARGS=65
declare -r E_BAD_ARGS=66
declare -r E_WRONG_ARGC=70
declare -r E_FILE_NOT_EXIST=71
declare -r E_NOROOT=87

# Handle HUP, INT, QUIT, TERM
trap handle_signal 1 2 3 15
# Handle Errors
trap handle_error ERR

#--- cleanexit() ---------------------------------------------------------------
# Displays status message before abndoining failed script execution.
# @param $1 INTEGER Exit Status.
#                   If not defined, global variable EXIT_STATUS is consulted,
#                   If neither $1 or EXIT_STATUS is defined, assume success (0).
#-------------------------------------------------------------------------------
function cleanexit () {
  echo "Halting execution with #{1:-${EXIT_STATUS:-0}}"
  exit ${1:-${EXIT_STATUS:-0}}
}

#--- verify_root() -------------------------------------------------------------
# Ensures that the script is running as the root user; if use of another account
# is detected, execution is aborted.
#-------------------------------------------------------------------------------
verify_root () {
  if [[ $UID -ne "$ROOT_UID" ]]; then
    echo "Only root user may run this script."
    exit $E_NOROOT
  fi
}

error () { echo "==> ERROR: "$@""; } >&2

msg () { echo "-> "$@""; }

show_error () {
  echo -e $'\033[1;31m'"$*"$'\033[' 1>&2
}

show_info () {
  echo -e $'\033[1;32m'"$*"$'\033[0m'
}

show_warning () {
  echo -e $'\033[1;33m'"$*"$'\033[0m'
}

show_success () {
  echo -e $'\033[1;35m'"$*"$'\033[0m'
}

show_header () {
  echo -e $'\033[1;36m'"$*"$'\033[0m'
}
