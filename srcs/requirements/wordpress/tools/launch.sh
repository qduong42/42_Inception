#!/bin/bash

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
# Replace all occurrences of a string in a file by overwriting the file (i.e. in place):
#	already done manually, keeping it in just in case
# -R recursively change permissions for directories and their contents
mkdir -p /var/www/html/wordpress;
chmod 775 /var/www/html/wordpress;
# The following example will change the owner of all files and
# subdirectories in the /var/www/html/wordpress directory with a new owner and group named www-data :
adduser -S -G www-data www-data;
chown -R www-data:www-data /var/www/html/wordpress/;
mkdir -p /run/php/;
touch /run/php/php-fpm81.pid;

# After checking the requirements, download the wp-cli.phar file using wget or curl:
# then, make it executable and move it to PATH
# Downloads and extracts the main WordPress files
echo "Wordpress: setting up..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
echo $(php wp-cli.phar --info --allow-root)
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;
cd /var/www/html/wordpress;


#download and configure wordpress
wp core download --allow-root;
mv /var/www/wp-config.php /var/www/html/wordpress;
echo "Wordpress: creating users..."
chmod -R 775 /var/www/html/wordpress;
chown -R www-data:www-data /var/www/html/wordpress/
# Creates WordPress tables in the database,
# using the url, title and default admin user details provided
#	--url=<url>
# Address of the new site.
#	--title=<site name>
# The name of the new site.
#	--admin_user=<username>
# Administrator username.
#	[--admin_password=<password>]
# Password for the admin user. The default is a randomly generated string.
#	--admin_email=<email>
# Administrator's email address.
wp core install --allow-root --url=$WORDPRESS_URL --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_LOGIN \
				--admin_password=$WORDPRESS_ADMIN_PASSWORD \
				--admin_email=$WORDPRESS_ADMIN_EMAIL;
echo "Admin user has been created!"
# Creates a new user
#	<user-login>
# Username to create.
#	<user-email>
# The email address of the user to create.
#	[--role=<role>]
# User role to create. Default: default role
# Possible values ​​include "administrator", "editor", "author", "contributor", "subscriber".
#	[--user_pass=<password>]
# User password. Default: randomly generated
wp user create --allow-root $WORDPRESS_USER_LOGIN $WORDPRESS_USER_EMAIL --role=contributor --user_pass=$WORDPRESS_USER_PASSWORD;
# Theme for WordPress
wp theme install twentytwentytwo --activate --allow-root
# wp theme install oceanwp --activate --allow-root


echo "Wordpress: set up!"

wp plugin install disable-emails --activate;
wp plugin install wp-redis --activate;

# wp help disable-comments settings;
# wp disable-comments settings --remove;

# echo "wp disable comment activated!"
else
echo "Wordpress: is already set up!"
fi

echo "Wordpress started on :9000"

/usr/sbin/php-fpm81 -F

# wp core install --allow-root --url=127.0.0.1 --title=inception --admin_user=chief --admin_password=chief222 --admin_email=creator@42.fr;