#!/bin/sh
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "grant all privileges on ${MYSQL_DATABASE}.* to ${MYSQL_USER}@'%' identified by '${MYSQL_PASSWORD}';"
sleep 2
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "flush privileges;"
sleep 2
mysql -uroot -p$MYSQL_ROOT_PASSWORD ${MYSQL_DATABASE} < /zbx/schema.sql
sleep 2
mysql -uroot -p$MYSQL_ROOT_PASSWORD ${MYSQL_DATABASE} < /zbx/images.sql
sleep 2
mysql -uroot -p$MYSQL_ROOT_PASSWORD ${MYSQL_DATABASE} < /zbx/data.sql