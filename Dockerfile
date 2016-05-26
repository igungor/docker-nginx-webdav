FROM debian:jessie

RUN apt-get update && \
    apt-get install -y nginx nginx-extras && \
    rm -rf /var/lib/apt/lists/* && \
    rm /etc/nginx/sites-enabled/default && \
    mkdir -p /var/www/.temp && \
    chown -R www-data:www-data /var/www && \
    chmod -R a+rw /var/www

COPY webdav.conf /etc/nginx/sites-enabled/
VOLUME /var/www
EXPOSE 80
CMD nginx -g "daemon off;"
