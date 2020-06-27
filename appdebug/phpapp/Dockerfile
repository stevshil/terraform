FROM webdevops/php-apache:7.4
COPY simple_academy_php_app/public/* /app/
ADD simple_academy_php_app/public/templates /app/templates
ADD simple_academy_php_app/public/css /app/css
COPY simple_academy_php_app/config.php /
COPY simple_academy_php_app/common.php /
ENV DBHOST=localhost
ENV DBUSER=root
ENV DBPASS=secret123
