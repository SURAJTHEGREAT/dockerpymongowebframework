#!/bin/bash

# Create env files in the specified directory

CONF_DIR=${1:-conf}

FILENAME="${PWD}/git-pwd"
bash ${PWD}/bin/git-encrypt.sh
ENCRYPTED_GIT_PWD=`crudini --get ${FILENAME} '' PWD`
GIT_PASS_KEY=`crudini --get ${FILENAME} '' PASSKEY`
rm -f ${FILENAME} 
mkdir -p ${CONF_DIR}

if [ ! -f ${CONF_DIR}/mongo.env ]; then
  echo "MONGO_HOST=${MONGO_HOST:-mongo_db}" > ${CONF_DIR}/mongo.env
  echo "MONGO_PORT=${MONGO_PORT:-27017}" >> ${CONF_DIR}/mongo.env
  if [ -z ${MONGO_DB} ]; then
    echo "#MONGO_DB=" >> ${CONF_DIR}/mongo.env
  else
    echo "MONGO_DB=${MONGO_DB}" >> ${CONF_DIR}/mongo.env
  fi
  if [ -z ${MONGO_USER} ]; then
    echo "#MONGO_USER=" >> ${CONF_DIR}/mongo.env
  else
    echo "MONGO_USER=${MONGO_USER}" >> ${CONF_DIR}/mongo.env
  fi
  if [ -z ${MONGO_PASS} ]; then
    echo "#MONGO_PASS=" >> ${CONF_DIR}/mongo.env
  else
    echo "MONGO_PASS=${MONGO_PASS}" >> ${CONF_DIR}/mongo.env
  fi
fi



if [ ! -f ${CONF_DIR}/proxy.env ]; then
  echo "proxy_enabled=${proxy_enabled:-False}" > ${CONF_DIR}/proxy.env
  
  echo "#assoc_id=${assoc_id:- }" >> ${CONF_DIR}/proxy.env
  
  echo "#assoc_pwd=${assoc_pwd:- }" >> ${CONF_DIR}/proxy.env
  
  echo "#proxy_dns=${proxy_dns:- }" >> ${CONF_DIR}/proxy.env
  
  echo "#proxy_port=${proxy_port:- }" >> ${CONF_DIR}/proxy.env

  
fi


if [ ! -f ${CONF_DIR}/repo.env ]; then
  
  echo "git_user=${git_user:- }" > ${CONF_DIR}/repo.env
  
  echo "git_pwd=${git_pwd:-${ENCRYPTED_GIT_PWD} }" >> ${CONF_DIR}/repo.env
  
  echo "git_passkey=${git_passkey:-${GIT_PASS_KEY} }" >> ${CONF_DIR}/repo.env

  echo "git_repo=${git_repo:- #bottle-pymongo}" >> ${CONF_DIR}/repo.env
  
fi

if [ ! -f ${CONF_DIR}/config.env ]; then
  
  echo "CONFIG_PATH=${CONFIG_PATH:- }" > ${CONF_DIR}/config.env
  echo "WEB_SERVICE=${WEB_SERVICE:- #bottle}" >> ${CONF_DIR}/config.env 
 
  
fi

