#!/bin/bash
sed -i s/MYSQL_HOST/$MYSQL_HOST/g /var/www/html/conf/zabbix.conf.php
sed -i s/MYSQL_PORT/$MYSQL_PORT/g /var/www/html/conf/zabbix.conf.php
sed -i s/MYSQL_DATABASE/$MYSQL_DATABASE/g /var/www/html/conf/zabbix.conf.php
sed -i s/MYSQL_USER/$MYSQL_USER/g /var/www/html/conf/zabbix.conf.php
sed -i s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g /var/www/html/conf/zabbix.conf.php
sed -i s/ZABBIX_SERVER_HOST/$ZABBIX_SERVER_HOST/g /var/www/html/conf/zabbix.conf.php
sed -i s/ZABBIX_SERVER_PORT/$ZABBIX_SERVER_PORT/g /var/www/html/conf/zabbix.conf.php
sed -i s/ZABBIX_SERVER_NAME/$ZABBIX_SERVER_NAME/g /var/www/html/conf/zabbix.conf.php
/usr/sbin/httpd -DFOREGROUND