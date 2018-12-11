#!/bin/bash
sed -i s/DBHost=DBHost/DBHost=$MYSQL_HOST/g /usr/local/zabbix/etc/zabbix_server.conf
sed -i s/DBName=DBName/DBName=$MYSQL_DATABASE/g /usr/local/zabbix/etc/zabbix_server.conf
sed -i s/DBUser=DBUser/DBUser=$MYSQL_USER/g /usr/local/zabbix/etc/zabbix_server.conf
sed -i s/DBPassword=DBPassword/DBPassword=$MYSQL_PASSWORD/g /usr/local/zabbix/etc/zabbix_server.conf
sed -i s/DBPort=DBPort/DBPort=$MYSQL_PORT/g /usr/local/zabbix/etc/zabbix_server.conf
/usr/local/zabbix/sbin/zabbix_server -f -c /usr/local/zabbix/etc/zabbix_server.conf