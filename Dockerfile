FROM mageinferno/magento2-php:7.0.8-fpm-3
MAINTAINER Duy <duy@dwork.vn>

ARG REPO_MAGENTO_USERNAME
ARG REPO_MAGENTO_PASSWORD

ENV COMPOSER_HOME /root/.composer/

RUN composer config -g repositories.magento '{ "type": "composer", "url": "https://repo.magento.com/" }'
RUN composer config -g http-basic.repo.magento.com $REPO_MAGENTO_USERNAME $REPO_MAGENTO_PASSWORD
RUN composer global config minimum-stability alpha

RUN composer global require "hirak/prestissimo:^0.3"
RUN composer global require "magento/project-community-edition:2.1.1"

WORKDIR /srv/www

CMD ["/usr/local/bin/start"]
