Package Zabbix Server 4.0.1 + Zabbix Agent 4.0.1 + Mysql 5.7.24 + Apache 2.4.6

What you need:
CentOS 7, 
Docker, 
Docker-compose, 
Internet connection, 
4 cores cpus, 8gb ram, 50G free disk at least

Follow this steps to install Docker-compose:
https://docs.docker.com/compose/install/

Package:
https://github.com/psgabriel/zbx_srv4_zbx_agt_mysql5_apache2.git

Before install, ensure there are no listened this ports:
3306, 33060, 10050, 10051 and 80

Edit default_variables_database.env and default_variables_zabbix.env to customize important Application and Database parameters.

If not exist, Docker will create /var/lib/mysql/ to store Mysql db.

Inside the downloaded package folder, run:
docker-compose --verbose up -d

Check if all services are running:
docker ps -a

zabbix_agent
zabbix_front
zabbix_server
zabbix_db

Can be necessary allow Zabbix Server connects to Zabbix Agent through Firewall.
Allow with this: iptables -A INPUT -p tcp -s 172.6.0.3 --dport 10050 -m state --state NEW,ESTABLISHED -j ACCEPT