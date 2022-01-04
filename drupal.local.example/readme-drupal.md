### Drupal Setup

mkdir laradock
cd laradock
git clone https://github.com/laradock/laradock.git .

# Cloning a Project with Submodules
# https://git-scm.com/book/en/v2/Git-Tools-Submodules#
git submodule update --init
git submodule foreach git pull origin master

cp drupal.local.example/laradock/.env laradock/.env


sudo docker rm $(sudo docker stop $(sudo docker ps -a -q)) && \
sudo docker rmi $(sudo docker images -q) && \
sudo docker volume rm $(sudo docker volume ls -q)

# "apache" container
cp drupal.local.example/laradock/apache2/sites/drupal.local.conf laradock/apache2/sites/drupal.local.conf

# "nginx" container
cp drupal.local.example/laradock/nginx/sites/drupal.local.conf laradock/nginx/sites/drupal.local.conf

# "mysql" container
cp drupal.local.example/laradock/mysql/docker-entrypoint-initdb.d/drupal.local.sql laradock/mysql/docker-entrypoint-initdb.d/drupal.local.sql


docker-compose --env-file laradock/.env -f laradock/docker-compose.yml up -d apache2 mysql phpmyadmin workspace php-fpm
a2ensite drupal.local

### https://www.drupal.org/docs/develop/using-composer/using-composer-to-install-drupal-and-manage-dependencies
composer create-project drupal/recommended-project drupal.local
composer create-project drupal/recommended-project drupal.local "9.0"

### Check the tags available.
composer show drupal/recommended-project --all

### Add new modules and themes with composer require
composer require drupal/coffee
composer require drush/drush

### All of your modules and themes can be updated along with Drupal core via
composer update

### To update only Drupal core without any modules or themes, use
composer update drupal/core-recommended --with-dependencies

# Drush Commandline Tool 10.3.6-dev
composer require --dev drush/drush
./vendor/drush/drush/drush --version
./vendor/drush/drush/drush cr


docker-compose --env-file laradock/.env -f laradock/docker-compose.yml up -d apache2 mysql phpmyadmin workspace php-fpm

# inside the "workspace" container
composer require "drush/drush"
root@a091ac7269c1:/var/www/drupal.local# ./vendor/drush/drush/drush --version
Drush Commandline Tool 10.6.2
./vendor/drush/drush/drush cr
[success] Cache rebuild complete.
