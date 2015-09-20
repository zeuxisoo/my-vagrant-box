#!/usr/bin/env bash

# Update
sudo apt-get -y update

# Set locale
sudo locale-gen UTF-8
sudo dpkg-reconfigure locales

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Requirements
sudo apt-get -y install python-software-properties
sudo apt-get -y install pkg-config
sudo apt-get -y install build-essential
sudo apt-get -y install git
sudo apt-get -y install curl

# Latest PHP
# add-apt-repository ppa:ondrej/php5

# Apache
sudo apt-get -y install apache2
sudo apt-get -y install apache2-utils

# Stop Apache
sudo /etc/init.d/apache2 stop

# Apache Setup
sudo chown -Rf vagrant:vagrant /var/lock/apache2
sudo cp -f /vagrant/files/etc/apache2/httpd.conf /etc/apache2/
sudo cp -f /vagrant/files/etc/apache2/envvars /etc/apache2/
sudo cp -f /vagrant/files/etc/apache2/sites-enabled/000-default /etc/apache2/sites-enabled/

# Restart Apache
sudo /etc/init.d/apache2 restart

# MySQL
sudo apt-get -y -f remove mysql-server-core-5.5
sudo apt-get -y -f remove mysql-server-5.5
sudo apt-get -y -f remove mysql-server-5.5
sudo apt-get -y -f remove mysql-server

debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'

sudo apt-get -y install mysql-server
sudo apt-get -y install mysql-client

# PHP
sudo apt-get -y build-dep php5
sudo apt-get -y install libapache2-mod-php5
sudo apt-get -y install php-apc
sudo apt-get -y install php-pear
sudo apt-get -y install php5-cli
sudo apt-get -y install php5-common
sudo apt-get -y install php5-dev
sudo apt-get -y install php5-gd
sudo apt-get -y install php5-mysql
sudo apt-get -y install php5-curl
sudo apt-get -y install php5-mcrypt
sudo apt-get -y install php5-sqlite
sudo apt-get -y install php5-pgsql
sudo apt-get -y install php5-mysql
sudo apt-get -y install php5-xdebug
sudo apt-get -y install php5-suhosin

# PHP Setup
sudo cp -f /vagrant/files/etc/php5/cli/php.ini /etc/php5/cli/
sudo cp -f /vagrant/files/etc/php5/apache2/php.ini /etc/php5/apache2/

# MySQL Setup
sudo cp -f /vagrant/files/etc/mysql/my.cnf /etc/mysql/

# Restart MySQL
sudo service mysql restart

# Enable mod_rewrite
sudo a2enmod rewrite

# Restart Apache
/etc/init.d/apache2 restart

# PHP Composer
mkdir /home/vagrant/bin
curl -sS https://getcomposer.org/installer | php -- --install-dir=/home/vagrant/bin
mv /home/vagrant/bin/composer.phar /home/vagrant/bin/composer
chown -R vagrant:vagrant /home/vagrant/bin

# Zsh
apt-get install zsh
apt-get install wget
git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
sudo chsh -s `which zsh` vagrant
sudo chown vagrant:vagrant /home/vagrant/.oh-my-zsh
sudo chown vagrant:vagrant /home/vagrant/.zshrc

# Zsh Replace
sudo cp -f /vagrant/files/home/vagrant/.zshrc /home/vagrant/
sudo chown vagrant:vagrant /home/vagrant/.zshrc

# Git FTP
sudo add-apt-repository ppa:resmo/git-ftp
sudo apt-get update
sudo apt-get -y install git-ftp

# Others
sudo apt-get -y install htop
sudo apt-get -y install rsync
sudo apt-get -y install python-dev python-pip
sudo apt-get -y install zip
sudo apt-get -y install vim
