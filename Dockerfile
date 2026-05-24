FROM nginx:alpine

RUN apk add --no-cache bash

COPY index.html /usr/share/nginx/html/index.html
COPY entrypoint.sh /entrypoint.sh
COPY railway-nginx.conf /etc/nginx/templates/default.conf.template

RUN chmod +x /entrypoint.sh

EXPOSE 80

CMD ["/entrypoint.sh"]
