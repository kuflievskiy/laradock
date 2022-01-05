#### Ubuntu-specific UFW config, check if host OS allow connections to 9000/9003 ports
```
sudo ufw status
sudo ufw verbose
sudo ufw enable
sudo ufw allow in from 172.16.0.0/12 to any port 9003 comment xDebug9003
sudo ufw allow in from 172.16.0.0/12 to any port 9000 comment xDebug9000
```

services:

### Workspace Utilities ##################################
```
workspace:
      extra_hosts:
        - "host.docker.internal:host-gateway"
```
### PHP-FPM ##############################################
```
php-fpm:
        extra_hosts:
        - "host.docker.internal:host-gateway"
```

```
vim /usr/local/etc/php/conf.d/xdebug.ini
```

#### Xdebug 3
####
```
xdebug.client_host=host.docker.internal
xdebug.client_port=9000
xdebug.mode=debug
####xdebug.mode=develop
xdebug.idekey=PHPSTORM
xdebug.start_with_request=yes
xdebug.log=/tmp/xdebug.log
```