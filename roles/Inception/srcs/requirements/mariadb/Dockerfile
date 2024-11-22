FROM debian:buster

LABEL maintainer="BOUMLIK BRAHIM <boumlik01brahim@gmail.com>" Description="Mariadb Docker image based on Debian 11"

RUN apt-get -y update && apt-get -y install mariadb-server dumb-init

EXPOSE 3306

COPY ./conf/50-server.cnf ./etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools /

RUN chmod +x /script.sh

ENTRYPOINT ["/usr/bin/dumb-init"]

CMD ["./script.sh"]