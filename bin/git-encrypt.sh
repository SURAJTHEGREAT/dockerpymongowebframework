#!/bin/bash
FILENAME="${PWD}/git-pwd"
function fetch_values() {
  # FETCH VALUES FROM GIT-PWD FILENAME
  if [ ! ${FILENAME} ] ; then
  echo "FILE git-pwd DOES NOT EXIST - PLEASE ENSURE IF FILE IS CREATED"
  exit 1
  fi
  GIT_PWD=`crudini --get ${FILENAME} '' PWD`
  GIT_PASSKEY=`crudini --get ${FILENAME} '' PASSKEY`
  ENCRYPTED_PWD=$(encyrpt_pwd ${GIT_PWD} ${GIT_PASSKEY})
  crudini --set ${FILENAME} '' PWD ${ENCRYPTED_PWD}   
}
function encyrpt_pwd() {
  # ENCYRPT THE PASSWORD
  local ENCRYPTED_PWD=`echo $1| openssl enc -aes-128-cbc -a -salt -pass pass:${2:-passkey}`
  echo "${ENCRYPTED_PWD}"
}

# this subshell is a scope of try
# try
(
  # this flag will make to exit from current subshell on any error
  # inside it (all functions run inside will also break on any error)
  set -e
  fetch_values

  # do more stuff here
)
# and here we catch errors
# catch
errorCode=$?
if [ $errorCode -ne 0 ]; then
  echo "We have an error"
  # We exit the all script with the same error, if you don't want to
  # exit it and continue, just delete this line.
  exit $errorCode
fi
