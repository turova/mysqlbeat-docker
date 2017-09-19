FROM ubuntu:16.04

#Install mysqlbeat release .deb
#Retrieved from https://github.com/adibendahan/mysqlbeat/releases/download/1.0.0/mysqlbeat_1.0.0-160512235547_amd64.deb
ADD mysqlbeat_1.0.0-160512235547_amd64.deb /
RUN dpkg -i mysqlbeat_1.0.0-160512235547_amd64.deb && \
    rm -rf mysqlbeat_1.0.0-160512235547_amd64.deb

ENTRYPOINT ["/usr/bin/mysqlbeat", "-e"]
