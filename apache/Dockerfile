FROM localhost:5000/centos:7

ENV YUM_REPO_URL="https://dev.mysql.com/get/mysql57-community-release-el7-10.noarch.rpm"
RUN rpm -ivh ${YUM_REPO_URL} && \
    yum install vim wget net-tools telnet httpd php-common php-pdo php-mbstring php-cli php-bcmath php-gd php-mysql php php-xml mod_ssl openssl php-ldap mysql-devel mysql-community-client -y

RUN yum update -y
RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf
COPY files/zabbix.conf /etc/httpd/conf/zabbix.conf
COPY files/php.ini /etc/php.ini

COPY files/frontend/ /var/www/html/
COPY files/zabbix.conf.php /var/www/html/conf/zabbix.conf.php
RUN chown -R apache.apache /var/www/html/ && \
    chmod -R 777 /var/www/html/

COPY files/init.sh /zbx/
RUN chmod 777 /zbx/init.sh
ENTRYPOINT ["sh","/zbx/init.sh"]
EXPOSE 80
WORKDIR /