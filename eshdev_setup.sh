#!/bin/bash

# Upgrade installed packages
sudo apt-get update
sudo apt list --upgradable
sudo apt-get -y upgrade

# Declare the list of packages to install
declare -a PKGS=(
    composer
    mysql-server
    php8.1
    php-imagick
    php-curl
    php-mbstring
    php-mysql
    php-xdebug
    php-xml
    # The following packages might be needed.
    # I honestly can't recall whether the variants
    # with the version numbers were needed in order
    # for the development environment to properly work.
    #php8.1-cli
    #php8.1-common
    #php8.1-curl
    #php8.1-imagick
    #php8.1-intl
    #php8.1-mbstring
    #php8.1-mysql
    #php8.1-opcache
    #php8.1-readline
    #php8.1-xdebug
    #php8.1-xml
    #php-intl
    #php-json-schema
)

# Install packages
for p in "${PKGS[@]}"
do
    echo Installing "$p"
    sudo apt-get install -y $p
done

# Start the MySQL service
echo Initialising MySQL...
echo To correctly run the mysql_secure_installation script please run the following command:
echo ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
echo Then, exit MySQL and run the script.
echo To restore the default configuration, connect to MySQL with:
echo mysql -u root -p
echo Run the following command:
echo ALTER USER 'root'@'localhost' IDENTIFIED WITH auth_socket;
echo You will thus be able to connect to MySQL as the root user with:
echo sudo mysql
sudo systemctl start mysql.service

# Begin MySQL configuration
sudo mysql
