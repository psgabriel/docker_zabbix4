FROM localhost:5000/centos:7

ENV YUM_REPO_URL="https://dev.mysql.com/get/mysql57-community-release-el7-10.noarch.rpm"
ENV YUM_ZBXGET_REPO_URL="https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-get-4.0.1-1.el7.x86_64.rpm"

RUN rpm -ivh ${YUM_REPO_URL} && \
    rpm -ivh ${YUM_ZBXGET_REPO_URL}
RUN yum install epel-release sudo vim fping telnet configure net-tools gcc make libxml2-devel net-snmp-devel libcurl-devel openssl-devel crontabs libevent-devel mysql-devel mysql-community-client zabbix-get -y
#RUN yum update -y

RUN groupadd zabbix && \
    useradd -g zabbix zabbix

COPY files/ /zbx/
WORKDIR /zbx/zabbix_install
RUN ./configure --prefix=/usr/local/zabbix --enable-server --with-net-snmp --with-mysql --with-libcurl --with-libxml2 --with-openssl && \
    touch configure.ac aclocal.m4 configure Makefile.am Makefile.in && \
    make install

RUN mv /usr/local/zabbix/etc/zabbix_server.conf /usr/local/zabbix/etc/zabbix_server_original.conf && \
    cp /usr/bin/zabbix_get /usr/local/zabbix/sbin/zabbix_get && \
    cp /zbx/zabbix_server.conf /usr/local/zabbix/etc/zabbix_server.conf && \
    chmod -R 777 /usr/local/zabbix/*

USER root
RUN cp /zbx/sudoers /etc/sudoers
RUN chmod 440 /etc/sudoers

RUN chown zabbix.zabbix /zbx/init.sh && \
    chmod 777 /zbx/init.sh
ENTRYPOINT ["sh","/zbx/init.sh"]
USER zabbix
WORKDIR /zbx
