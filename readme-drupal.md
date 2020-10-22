### Drupal Setup

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

