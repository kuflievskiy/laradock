#!/bin/bash

# A command string or list of command arguments to run on the host machine before the container is created. .
# https://code.visualstudio.com/docs/remote/devcontainerjson-reference

# git submodule update
git submodule update --init --recursive

# Copy Apache laravel.local.conf
cp laravel.local.example/laradock/apache2/sites/laravel.local.conf laradock/apache2/sites/laravel.local.conf

# Add line to /etc/hosts
sudo echo "127.0.0.1 laravel.local www.laravel.local" | sudo tee -a /etc/hosts

# Configure Laradock environment
cp laravel.local.example/laradock/.env laradock/.env

# mysql container - set docker-entrypoint-initdb.d
cp -av laravel.local.example/laradock/mysql/docker-entrypoint-initdb.d laradock/mysql