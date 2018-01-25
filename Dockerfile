FROM 056154071827.dkr.ecr.us-east-1.amazonaws.com/base-image-php
MAINTAINER cru.org <apps@cru.org>

# Nginx is pointed at /var/www/app as document root
# App is installed at /home/app

# Copy post-deploy scripts
RUN mkdir -p /home/app/bin
COPY app /home/app/public
COPY docker/post-deploy.sh /home/app/bin/
COPY docker/supervisord-post-deploy.conf /etc/supervisor/conf.d/
COPY docker/app.conf /usr/local/openresty/nginx/conf.d/nginx-httpd.conf
RUN chmod -R 777 /home/app

