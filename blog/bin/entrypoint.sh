#!/bin/bash

mkdir -p `dirname ${CONFIG_PATH}`

touch ${CONFIG_PATH}

crudini --set ${CONFIG_PATH} database host ${MONGO_HOST}
crudini --set ${CONFIG_PATH} database port ${MONGO_PORT}

if [ ! -z ${MONGO_DB} ]; then
  crudini --set ${CONFIG_PATH} database db_name ${MONGO_DB}
fi

if [ ! -z ${MONGO_USER} ]; then
  crudini --set ${CONFIG_PATH} database username ${MONGO_USER}
fi

if [ ! -z ${MONGO_PASS} ]; then
  crudini --set ${CONFIG_PATH} database password ${MONGO_PASS}
fi


# Run custom init scripts
for f in /blog-docker/entrypoint.d/*; do
  case "$f" in
    *.sh) echo "$0: running $f"; . "$f" ;;
    *)    echo "$0: ignoring $f" ;;
  esac
  echo
done

# 1ppc: launch entrypoint-1ppc.sh via dumb-init if $WEB_SERVICE is set
if [ ! -z ${WEB_SERVICE} ]; then
  sh /blog-docker/bin/entrypoint-1ppc.sh
fi


exec /sbin/init

