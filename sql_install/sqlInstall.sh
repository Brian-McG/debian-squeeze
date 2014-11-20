#!/bin/bash
debconf-set-selections <<< 'mysql-server-5.1 mysql-server/root_password password rootpass'
debconf-set-selections <<< 'mysql-server-5.1 mysql-server/root_password_again password rootpass'
apt-get -y install mysql-server-5.1
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
