#!/bin/bash

# This file contains the application setup completion steps from CI script placed here: .github/workflows/push.yml

cd /var/www/laravel.local/

# Copy Laravel .env configuration file
cp /var/www/laravel.local.example/laravel.local/.env /var/www/laravel.local/.env

# Set file permissions for ./laravel.local/storage
chmod 777 /var/www/laravel.local/storage -R

# Set file permissions for ./laravel.local/bootstrap/cache
chmod 777 /var/www/laravel.local/bootstrap/cache -R

# Install application dependencies
composer install -n

php artisan config:clear
php artisan cache:clear
php artisan migrate
php artisan db:seed
php artisan test