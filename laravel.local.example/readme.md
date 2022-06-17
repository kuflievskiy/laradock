#### Clone the project code
```
git clone https://github.com/kuflievskiy/laradock EducationProject
```
#### Pull the Laradock code as submodule
```
git submodule add https://github.com/Laradock/laradock.git
git submodule update --init --recursive
```
#### Remove all the existing containers, images, volumes
```
sudo docker rm $(sudo docker stop $(sudo docker ps -a -q)) && sudo docker rmi $(sudo docker images -q) && sudo docker volume rm $(sudo docker volume ls -q)
```

####  Stop the services which use :80, :443, :3306 ports
####  Because these ports will be required to run docker containers
```
sudo service mysql stop
sudo service apache2 stop
sudo service nginx stop
```

#### Remove the existing laravel.local folder, let's create the site from scratch
```
rm -rf laravel.local
```
#### Copy Apache laravel.local.conf
```
cp laravel.local.example/laradock/apache2/sites/laravel.local.conf laradock/apache2/sites/laravel.local.conf
```

#### Create folder laravel.local
```
mkdir laravel.local
```

#### Setup local hosts "laravel.local www.laravel.local"
```
sudo vim /etc/hosts
127.0.0.1 laravel.local www.laravel.local
```

#### Configure Laradock environment
```
cp laravel.local.example/laradock/.env laradock/.env

vim laradock/.env
# WORKSPACE_INSTALL_XDEBUG=true
# PHP_FPM_INSTALL_XDEBUG=true
# WORKSPACE_INSTALL_DRUSH=drush
# WORKSPACE_DRUSH_VERSION=8.1.17
# WORKSPACE_INSTALL_WP_CLI=true
# PHP_VERSION=7.4

# on Ubuntu, when local UID is different from 1000
WORKSPACE_PUID=1001
WORKSPACE_PGID=1000

# deny access to the containers from the local network
# by default all the containers are running on 0.0.0.0 IP Address
APACHE_HOST_HTTP_PORT=127.0.0.1:80
APACHE_HOST_HTTPS_PORT=127.0.0.1:443
MYSQL_PORT=127.0.0.1:3306
```

#### Build & run the containers in the detach mode
```
docker-compose --env-file laradock/.env -f laradock/docker-compose.yml up -d apache2 mysql workspace php-fpm
```



#### Login inside the 'workspace' container in order to install files
```
docker exec -it laradock_workspace_1 bash
```

#### Install 
```
cd /var/www/laravel.local
composer create-project --prefer-dist laravel/laravel .
```

#### Edit Laravel .env configuration file
```
cp laravel.local.example/laravel.local/.env laravel.local/.env

# vim /var/www/laravel.local/.env
APP_URL=http://laravel.local
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=default
DB_USERNAME=default
DB_PASSWORD=secret
```

#### 
```
The stream or file "/var/www/laravel.local/storage/logs/laravel.log" could not be opened in append mode: Failed to open stream: Permission denied

chmod 777 ./laravel.local/storage -R
chmod 777 ./laravel.local/bootstrap/cache -R

```