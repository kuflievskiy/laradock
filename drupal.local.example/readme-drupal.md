#### Clone the project code
git clone https://github.com/kuflievskiy/laradock EducationProject
#### Pull the Laradock code as submodule
git submodule update --init --recursive
#### Remove all the existing containers, images, volumes
sudo docker rm $(sudo docker stop $(sudo docker ps -a -q)) && sudo docker rmi $(sudo docker images -q) && sudo docker volume rm $(sudo docker volume ls -q)
#### Remove the existing drupal.local folder, let's create the site from scratch
rm -rf drupal.local
#### Copy Laradock .env configuration
cp drupal.local.example/laradock/.env laradock/.env
#### Copy Apache drupal.local.conf
cp drupal.local.example/laradock/apache2/sites/drupal.local.conf laradock/apache2/sites/drupal.local.conf
#### Copy MySQL config file my.cnf
cp drupal.local.example/laradock/mysql/my.cnf laradock/mysql/my.cnf
#### Build & run the containers in the detach mode
docker-compose --env-file laradock/.env -f laradock/docker-compose.yml up -d apache2 mysql workspace php-fpm
#### Login inside the 'workspace' container in order to install and configure Drupal
docker exec -it laradock_workspace_1 bash
#### Install Drupal via PHP composer
composer create-project drupal/recommended-project drupal.local -n

#### https://www.drupal.org/project/search_api/releases/8.x-1.21
#composer require 'drupal/search_api:^1.21'

####
cp drupal.local.example/drupal.local/web/sites/settings.local.php drupal.local/web/sites/settings.local.php
####
cp drupal.local.example/drupal.local/web/sites/default/settings.php drupal.local/web/sites/default/settings.php
####
mkdir -p drupal.local/web/sites/default/files
####
chmod 777 drupal.local/web/sites/default/files
####
http://www.drupal.local/admin/reports/status#error
####
mkdir -p drupal.local/web/sites/default/files/config_y_oGR0p9cXiOmw_ZlvFCVZKkMg7LCyGUI8pcCLT8I7lTbWlCbUnq046htnrF9Rye7pEQvNBd7A/sync
#### TRUSTED HOST SETTINGS
vim drupal.local/web/sites/default/settings.php
$settings['trusted_host_patterns'] = [
   '^www\.drupal\.local',
   '^drupal\.local',
];

#### UPDATE NOTIFICATIONS
#### Checks for available updates, and can securely install or update modules and themes via a web interface.
cd /var/www/drupal.local
composer require "drush/drush" -n
./vendor/drush/drush/drush --version
./vendor/drush/drush/drush en update

#### DRUPAL CORE UPDATE STATUS
#### No update data available
#### No update information available. Run cron or check manually.
./vendor/drush/drush/drush cron