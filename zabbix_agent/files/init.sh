#!/bin/bash
sed -i s/Server=Server/Server=$ZBX_SERVER_HOST/g /usr/local/zabbix/etc/zabbix_agentd.conf
sed -i s/ServerActive=ServerActive/ServerActive=$ZBX_SERVERACTIVE_HOST/g /usr/local/zabbix/etc/zabbix_agentd.conf
/usr/local/zabbix/sbin/zabbix_agentd -f -c /usr/local/zabbix/etc/zabbix_agentd.conf