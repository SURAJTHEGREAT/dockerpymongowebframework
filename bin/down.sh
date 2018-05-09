#!/bin/bash
folder_name=`basename "$PWD"`
echo $folder_name
docker-compose down
if [ $1 = 'yes' ]; then
   docker volume rm ${folder_name}_mongo_db_configdb_volume ${folder_name}_mongo_db_volume
fi
docker rmi -f blog_image:v1
