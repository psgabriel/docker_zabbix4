# Package Zabbix Server 4.0.1 + Zabbix Agent 4.0.1 + Mysql 5.7.24 + Apache 2.4.6

What you need:
```
CentOS 7, 
Docker, 
Docker-compose, 
Internet connection, 
4 cores cpus, 8gb ram, 50G free disk at least
```

# Follow these steps to install Docker-compose:
https://docs.docker.com/compose/install/

# Package:
https://github.com/psgabriel/docker_zabbix4.git

Before install, ensure there are no listened these ports:
```
3306, 33060, 10050, 10051 and 80
```
# Network
```
Environment subnet: 
172.6.0.0/16

      - "host: 172.6.0.1"
      - "zabbix_db: 172.6.0.2"
      - "zabbix_server: 172.6.0.3"
      - "zabbix_front: 172.6.0.4"
      - "zabbix_agent: 172.6.0.5"
```
# Set
Edit default_variables_database.env and default_variables_zabbix.env to customize important Application and Database parameters.

If not exist, Docker will create /var/lib/mysql/ to store Mysql db.

# Run
Inside the downloaded package folder, run:
```
docker-compose --verbose up -d
```
Check if all services are running:
```
docker ps -a
```
Can be necessary allow Zabbix Server connects to Zabbix Agent through Firewall.
Adjust your local iptables:
```
iptables -A INPUT -p tcp -s 172.6.0.3 --dport 10050 -m state --state NEW,ESTABLISHED -j ACCEPT
```
