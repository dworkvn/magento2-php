FROM mageinferno/magento2-php:7.0.8-fpm-3
MAINTAINER Duy <duy@dwork.vn>

WORKDIR /srv/www

CMD ["/usr/local/bin/start"]
