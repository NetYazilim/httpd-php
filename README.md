# httpd-php
```
docker run -d -p 80:80 -v c:\temp:/shared -e WEB_CONF=/shared/etc/httpd.conf -e PHP_INI=/shared/etc/php.ini netyazilim/httpd-php
```
