# Laradock is a full PHP development environment for Docker.
# https://laradock.io/

## 1 - Clone Laradock inside your PHP project or clone this repository with laradock inside

```bash
mkdir laradock
cd laradock
git clone https://github.com/laradock/laradock.git .
mkdir drupal.local
mkdir wordpress.local
```

## 2 - Enter the laradock folder and rename env-example to .env. or customize the .env file laradock/.env

```bash
cp laradock-example/.env laradock/.env

cp laradock-example/apache2/sites/drupal.local.conf laradock-example/apache2/sites/drupal.local.conf
cp laradock-example/apache2/sites/wordpress.local.conf laradock-example/apache2/sites/wordpress.local.conf

cp laradock-example/nginx/sites/drupal.local.conf laradock-example/nginx/sites/drupal.local.conf
cp laradock-example/nginx/sites/wordpress.local.conf laradock-example/nginx/sites/wordpress.local.conf

cp laradock-example/mysql/docker-entrypoint-initdb.d/drupal.local.sql laradock-example/mysql/docker-entrypoint-initdb.d/drupal.local.sql
cp laradock-example/mysql/docker-entrypoint-initdb.d/wordpress.local.sql laradock-example/mysql/docker-entrypoint-initdb.d/wordpress.local.sql
```

- Workspace (Laradock container that includes a rich set of pre-configured useful tools)
- Mysql
- Apache
- PHP-FPM
etc

### Config constants example:

```bash
WORKSPACE_INSTALL_XDEBUG=true
PHP_FPM_INSTALL_XDEBUG=true
WORKSPACE_INSTALL_DRUSH=drush
WORKSPACE_DRUSH_VERSION=8.1.17
WORKSPACE_INSTALL_WP_CLI=true
```

### "apache" container

```bash
vim apache2/sites/wordpress.local.conf
vim apache2/sites/drupal.local.conf
```

### "nginx" container

```bash
nginx/sites/wordpress.local.conf
nginx/sites/drupal.local.conf
```

### "mysql" container

mysql/docker-entrypoint-initdb.d/wordpress.local.sql

### Configure xdebug:
### https://laradock.io/documentation/#install-xdebug

```bash
docker-compose build workspace php-fpm
laradock/php-fpm/xdebug.ini
laradock/workspace/xdebug.ini
```

## 3 - Run your containers:

```bash
# https://docs.docker.com/compose/reference/down/
# docker-compose down

### docker-compose up -d nginx mysql phpmyadmin redis workspace 
docker-compose up -d nginx mysql phpmyadmin workspace php-fpm
docker-compose up -d apache2 mysql phpmyadmin workspace php-fpm
```

## 4 - Add hosts on your local machine

```bash
sudo vim /etc/hosts
127.0.0.1 drupal.local www.drupal.local
127.0.0.1 wordpress.local www.wordpress.local
```

## 5 - Try http://drupal.local or http://wordpress.local

- WordPress http://wordpress.local
- Drupal http://drupal.local
- phpmyadmin http://localhost:8081/
mysql
default
secret

### Connect to mysql container
```bash
sudo docker ps -a
# get CONTAINER ID of the 
sudo docker exec -it 33907e36f503 bin/bash
mysql -u root -p --host=mysql
root

or
sudo docker exec -it laradock_workspace_1 bash
```


# Related Links

https://github.com/kuflievskiy/docker-project-skeleton/