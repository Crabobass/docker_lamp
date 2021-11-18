#!/bin/bash

# import in docker container
# db.sql should be in /data/mysql
docker stop $(docker ps -aq)
docker-compose up -d
echo "Import database start" $(date +"%T") 
docker container exec -it tf-database bash -c "mysql -uroot -pdocker -e 'drop database docker; create database docker;'; mysql -uroot -pdocker docker < /var/lib/mysql/db.sql"
echo "Import database finish" $(date +"%T")