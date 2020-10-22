### WordPress Setup

https://wp-cli.org/

wp --allow-root core download
wp --allow-root config create --dbname=wordpress --dbuser=wordpress --dbpass=secret --dbhost=mysql --locale=en_EN
wp --allow-root core install --url=wordpress.local --title=WordPressLocal --admin_user=admin --admin_password=password --admin_email=test@gmail.com
wp --allow-root core version

wp --allow-root plugin install woocommerce
wp --allow-root plugin activate woocommerce