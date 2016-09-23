FROM mageinferno/magento2-php:7.0.8-fpm-3
MAINTAINER Duy <duy@dwork.vn>

ENV COMPOSER_HOME /root/.composer/

RUN composer config -g repositories.magento '{ "type": "composer", "url": "https://repo.magento.com/" }'
RUN composer config -g http-basic.repo.magento.com a2c82563ebbece3279b5b958b8174f71 c019af644525528b713ad362e76c86b6
RUN composer global config minimum-stability alpha

RUN composer global require "hirak/prestissimo:^0.3"
RUN composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition
RUN rm -rf ./project-community-edition

WORKDIR /srv/www

CMD ["/usr/local/bin/start"]
