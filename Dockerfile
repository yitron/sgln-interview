FROM nginx:alpine

RUN apk add --no-cache bash gettext

# Copy app
COPY index.html /usr/share/nginx/html/index.html

# Copy nginx template — will be processed by entrypoint
COPY railway-nginx.conf /etc/nginx/conf.d/default.conf.template

# Remove default nginx config so ours takes over
RUN rm -f /etc/nginx/conf.d/default.conf

# Copy and permission entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

CMD ["/entrypoint.sh"]
