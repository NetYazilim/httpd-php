FROM netyazilim/alpine-base:3.8

LABEL maintainer "Levent SAGIROGLU <LSagiroglu@gmail.com>"

EXPOSE 80 443
ENV PHP_INI "/etc/php7/php.ini"
ENV WEB_CONF "/etc/apache2/httpd.conf"
ADD *.php /var/www/localhost/htdocs/
ADD entrypoint.sh /bin/entrypoint.sh

RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache apache2 php7-apache2 

RUN mkdir -p /run/apache2  
RUN sed -i 's/DirectoryIndex index\.html/DirectoryIndex index\.php index\.html/g' /etc/apache2/httpd.conf
RUN sed -i '$ a PHPIniDir ${PHP_INI}' /etc/apache2/conf.d/php7-module.conf
RUN echo "ServerName localhost" >> /etc/apache2/httpd.conf
RUN chmod +x /bin/entrypoint.sh
CMD ["/bin/entrypoint.sh"]
