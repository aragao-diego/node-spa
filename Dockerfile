FROM node:7-alpine
MAINTAINER Diego Aragão <aragao.diego24@gmail.com>


RUN apk update \
  && apk --update --no-cache add sudo \
  && rm -rf /var/cache/apk/* \
  && npm install http-server-spa -g

EXPOSE 8080/tcp 22/tcp

ENTRYPOINT ["http-server-spa", "/var/www/", "index.html"]
