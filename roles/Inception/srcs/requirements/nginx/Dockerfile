FROM debian:buster

LABEL maintainer="BOUMLIK BRAHIM <boumlik01brahim@gmail.com>" Description="Ngnix Docker image based on Debian 11"

RUN apt-get -y update && apt-get -y install nginx dumb-init; \
    apt-get install -y certbot python3-certbot-nginx;

COPY ./conf/default ./etc/nginx/sites-available/ 

EXPOSE 443

ENTRYPOINT ["/usr/bin/dumb-init", "/usr/sbin/nginx"]

CMD ["-g", "daemon off;"]
