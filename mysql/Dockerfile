#FROM oraclelinux:7-slim
FROM localhost:5000/centos:7
ARG MYSQL_SERVER_PACKAGE=mysql-community-server-minimal-5.7.24
ARG MYSQL_SHELL_PACKAGE=mysql-shell-8.0.13

# Install server
RUN yum install -y https://repo.mysql.com/mysql-community-minimal-release-el7.rpm \
      https://repo.mysql.com/mysql-community-release-el7.rpm \
  && yum-config-manager --enable mysql57-server-minimal \
  && yum install -y \
      $MYSQL_SERVER_PACKAGE \
      $MYSQL_SHELL_PACKAGE \
      libpwquality \
  && yum clean all \
  && mkdir /docker-entrypoint-initdb.d
RUN mkdir /zbx

VOLUME /var/lib/mysql
COPY imports/* /zbx/
COPY import.sh /docker-entrypoint-initdb.d/import.sh
COPY docker-entrypoint.sh /zbx/init.sh
COPY healthcheck.sh /zbx/healthcheck.sh
ENTRYPOINT ["sh","/zbx/init.sh"]
HEALTHCHECK CMD /zbx/healthcheck.sh
EXPOSE 3306 33060
CMD ["mysqld"]