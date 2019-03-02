FROM php:7.3-apache
# define location of data files
COPY apache/ /var/www/html/
