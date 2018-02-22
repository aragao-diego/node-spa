FROM node:7-alpine
MAINTAINER Diego Aragão <aragao.diego24@gmail.com>


RUN apk update \
  && apk --update --no-cache add openssh sudo supervisor \
  && rm -rf /var/cache/apk/* \
  && npm install http-server-spa -g

COPY files/supervisord.conf /etc/

EXPOSE 8080/tcp 22/tcp
VOLUME /var/www

ENTRYPOINT ["supervisord", "--nodaemon", "-c", "/etc/supervisord.conf", "-j", "/tmp/supervisord.pid", "-l", "/var/log/supervisord.log"]
